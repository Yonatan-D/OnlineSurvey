<template>
  <div class="cross">
    <el-card>
      <el-row type="flex" justify="space-around">
        <el-col :span="10">
          <i class="el-icon-data-analysis"></i>
          <h4>交叉分析</h4>
          <span class="explain">（仅支持单选题）</span>
        </el-col>
        <el-col :span="10"></el-col>
      </el-row>
      <!-- 选择变量表单 -->
      <el-form
        :model="crossForm"
        :rules="rules"
        label-position="top"
        ref="crossForm"
        label-width="100px"
      >
        <el-row type="flex" justify="space-around">
          <el-col :span="10">
            <el-form-item label="自变量X" prop="xValue">
              <el-select
                v-model="crossForm.xValue"
                clearable
                placeholder="添加自变量"
                style="width:100%"
              >
                <el-option
                  style="width:315px"
                  v-for="(item, index) in qsitems"
                  :key="item.qsItemId"
                  :label="index+1+'. '+item.title"
                  :value="item.qsItemId"
                  :disabled="item.type !== 'radio'"
                ></el-option>
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-button size="mini" type="primary" @click="crossAnalysis">交叉分析</el-button>
            </el-form-item>
          </el-col>
          <el-col :span="10">
            <el-form-item label="因变量Y" prop="yValue">
              <el-select
                v-model="crossForm.yValue"
                clearable
                placeholder="添加因变量"
                style="width:100%"
              >
                <el-option
                  style="width:315px"
                  v-for="(item, index) in qsitems"
                  :key="item.qsItemId"
                  :label="index+1+'. '+item.title"
                  :value="item.qsItemId"
                  :disabled="item.type !== 'radio'"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <!-- 交叉表格 -->
      <div v-show="charts">
        <el-row style="padding:0 32px">
          <el-table :data="tableData" border show-summary sum-text="小计" style="width: 100%;">
            <el-table-column prop="product" label="X\Y"></el-table-column>
            <el-table-column
              v-for="(item, index) in tableHeader"
              :key="index"
              :prop="item"
              :label="item"
            ></el-table-column>
          </el-table>
        </el-row>
        <!-- 交叉图表 -->
        <el-row style="padding:32px">
          <div class="charts" ref="column"></div>
        </el-row>
      </div>
    </el-card>
  </div>
</template>

<script>
import QS from "qs";

export default {
  data() {
    let validateValue = (rule, value, callback) => {
      if (this.crossForm.xValue === this.crossForm.yValue) {
        callback(new Error("题目不能重复!"));
      } else {
        callback();
      }
    };

    return {
      crossForm: {
        xValue: "",
        yValue: ""
      },
      qsitems: {},
      rules: {
        xValue: [
          { required: true, message: "请添加自变量", trigger: "change" },
          { validator: validateValue, trigger: "change" }
        ],
        yValue: [
          { required: true, message: "请添加因变量", trigger: "change" },
          { validator: validateValue, trigger: "change" }
        ]
      },
      tableData: [],
      tableHeader: [],
      charts: false,
      myChart: null
    };
  },

  methods: {
    getQuestTitle() {
      let surveyId = this.$route.query.surveyId;
      this.$http.get(`survey/${surveyId}`).then(res => {
        this.qsitems = res.data.qsitems;
      });
    },

    crossAnalysis() {
      this.$refs.crossForm.validate(valid => {
        if (valid) {
          const data = {};
          data.xValue = this.crossForm.xValue;
          data.yValue = this.crossForm.yValue;

          this.$http
            .post("recycle/cross_analysis", QS.stringify(data))
            .then(res => {
              this.tableData = res.data.tableData;
              this.tableHeader = res.data.tableHeader;
              this.charts = true;
              setTimeout(() => {
                this.initColumnchart();
              }, 50);
            });
        } else {
          return false;
        }
      });
    },

    initColumnchart() {
      if(this.myChart) this.myChart.dispose();

      let dimensions = JSON.parse(JSON.stringify(this.tableHeader));
      dimensions.splice(dimensions.indexOf("小计"), 1);
      let series = [];
      for (let i = 0; i < dimensions.length; i++) {
        series.push({
          type: "bar",
          label: {
            show: true,
            position: "top"
          }
        });
      }
      dimensions.unshift("product");
      window.console.log(dimensions);
      let source = JSON.parse(JSON.stringify(this.tableData));

      let myChart = this.$echarts.init(this.$refs.column, "macarons");
      let option = {
        legend: {
          orient: "horizontal",
          center: "center"
        },
        tooltip: {},
        dataset: {
          dimensions: dimensions,
          source: source
        },
        xAxis: {
          type: "category",
          // axisLabel: {
          //       interval:0,//代表显示所有x轴标签显示
          //   }
          axisLabel: {
            interval:0,//代表显示所有x轴标签显示
            //坐标轴刻度标签的相关设置。
            formatter: function(params) {
              var newParamsName = ""; // 最终拼接成的字符串
              var paramsNameNumber = params.length; // 实际标签的个数
              var provideNumber = 10; // 每行能显示的字的个数
              var rowNumber = Math.ceil(paramsNameNumber / provideNumber); // 换行的话，需要显示几行，向上取整
              /**
               * 判断标签的个数是否大于规定的个数， 如果大于，则进行换行处理 如果不大于，即等于或小于，就返回原标签
               */
              // 条件等同于rowNumber>1
              if (paramsNameNumber > provideNumber) {
                /** 循环每一行,p表示行 */
                for (var p = 0; p < rowNumber; p++) {
                  var tempStr = ""; // 表示每一次截取的字符串
                  var start = p * provideNumber; // 开始截取的位置
                  var end = start + provideNumber; // 结束截取的位置
                  // 此处特殊处理最后一行的索引值
                  if (p == rowNumber - 1) {
                    // 最后一次不换行
                    tempStr = params.substring(start, paramsNameNumber);
                  } else {
                    // 每一次拼接字符串并换行
                    tempStr = params.substring(start, end) + "\n";
                  }
                  newParamsName += tempStr; // 最终拼成的字符串
                }
              } else {
                // 将旧标签的值赋给新标签
                newParamsName = params;
              }
              //将最终的字符串返回
              return newParamsName;
            }
          }
        },
        yAxis: {},
        series: series,
        toolbox: {
          feature: {
            saveAsImage: {} // 保存为图片
          }
        }
      };
      this.myChart = myChart;
      // 绘制图表
      myChart.setOption(option);
    }
  },

  mounted() {
    this.getQuestTitle();
  }
};
</script>

<style scoped>
.cross {
  width: 800px;
  margin: 20px auto;
}
h4 {
  display: inline-block;
  margin-left: 5px;
}
.explain {
  color: #4f4f4f;
  font-size: 14px;
}
.charts {
  height: 280px;
  padding-top: 20px;
  width: 100%;
  border: 1px solid #d6d6d6;
  border-radius: 10px;
}
</style>