<template>
  <div class="recycle" ref="recycle">
    <!-- 下载 -->
    <div style="float:right;margin:20px 0 0 5px;">
    <el-button type="primary" size="small" @click="saveAsImage('dataReport', '统计报表')" style="display:block;margin:5px auto;">
      <i
        class="el-icon-download"
        style="display:block;font-size:16px;font-weight:bold;margin-bottom:5px"
      ></i>下载
    </el-button>
    <!-- <el-button type="primary" size="small" @click="$print($refs.dataReport)" style="display:block;margin:5px auto;">
      <i
        class="el-icon-printer"
        style="display:block;font-size:16px;font-weight:bold;margin-bottom:5px"
      ></i>打印
    </el-button> -->
    </div>
      <el-card>
    <div class="dataReport" ref="dataReport" style="padding:0 32px;">
      <i class="el-icon-data-line"></i>
          <h4>数据分析</h4>
        <div v-if="questions.length == 0">暂无数据</div>
        <div
          v-for="(item, index) in questions"
          :key="index"
          style="margin-bottom:30px;padding-bottom:30px;border-bottom: 1px dashed #d6d6d6;"
        >
          第{{index+1}}题：{{item.title}}
          <span class="must" v-if="item.isRequired == 1">*</span>
          <span style="color:#999;margin-left:10px;">{{item.type | typeFilter(types)}}</span>
          <!-- 选择题/评分题显示表格 -->
          <div v-if="item.type=='radio' || item.type=='checkbox' || item.type=='rate'">
            <el-table :data="item.options" border stripe style="margin:10px 0px;">
              <el-table-column
                v-if="item.type=='radio' || item.type=='checkbox'"
                prop="value"
                label="选项"
                align="center"
                sortable
              ></el-table-column>
              <el-table-column
                v-if="item.type=='rate'"
                prop="value"
                label="评级"
                sortable
                align="center"
              >
                <template slot-scope="scope">
                  {{scope.row.value}}星
                  <i
                    v-for="indx of Number(scope.row.value)"
                    :key="'on'+indx"
                    class="el-icon-star-on"
                    style="color:#f7ba2a;"
                  ></i>
                  <i
                    v-for="indx of (5-Number(scope.row.value))"
                    :key="'off'+indx"
                    class="el-icon-star-off"
                    style="color:#c6d1de"
                  ></i>
                </template>
              </el-table-column>
              <el-table-column prop="number" label="小计" align="center" sortable></el-table-column>
              <el-table-column prop label="比例" align="center">
                <template slot-scope="scope">
                  <el-progress v-if="sums[index]==0" :percentage="0"></el-progress>
                  <el-progress
                    v-if="!sums[index]==0"
                    :percentage="Number((scope.row.number / sums[index] * 100).toFixed(2))"
                  ></el-progress>
                </template>
              </el-table-column>
              <template slot="append">
                <el-alert type="info" :closable="false" center>
                  <strong slot="title">本题有效填写人次：{{item.valid}}</strong>
                </el-alert>
              </template>
            </el-table>
            <!-- 评分题显示平均评分 -->
            <div v-if="item.type=='rate'" style="margin:10px 0px;">
              <el-tag>平均评分</el-tag>
              <el-rate
                v-model="rateAvgs[index]"
                disabled
                show-score
                text-color="#ff9900"
                style="display:inline-block;margin-left:5px;"
              ></el-rate>
            </div>
            <!-- 显示统计图表 -->
            <el-button size="mini" type="primary" @click="initColumnchart(item, index)">柱形图</el-button>
            <el-button size="mini" type="primary" @click="initPiechart(item, index)">饼状图</el-button>
            <el-button size="mini" type="primary" @click="initRingchart(item, index)">环形图</el-button>
            <el-button size="mini" type="primary" @click="initBarchart(item, index)">条形图</el-button>
            <div v-show="charts[index] == 1" class="charts" :ref="'column'+index"></div>
            <div v-show="charts[index] == 2" class="charts" :ref="'pie'+index"></div>
            <div v-show="charts[index] == 3" class="charts" :ref="'ring'+index"></div>
            <div v-show="charts[index] == 4" class="charts" :ref="'bar'+index"></div>
          </div>
          <!-- 文本题显示按钮 -->
          <el-button
            v-if="item.type=='textarea'"
            size="mini"
            type="primary"
            style="display:block;margin:10px 0px;"
            @click="lookTextDetail(`第${index+1}题：${item.title}`, item.id)"
          >查看详细信息</el-button>
        </div>
    </div>
      </el-card>
    <el-dialog
      :title="textTitle"
      :visible.sync="dialogTableVisible"
      :append-to-body="true"
      width="60%"
    >
      <el-table :data="textareaData">
        <el-table-column type="index" label="序号" width="75" align="center">
          <template slot-scope="scope">
            <span>{{scope.$index+(pageinfo.currentPage - 1) * pageinfo.pageSize + 1}}</span>
          </template>
        </el-table-column>
        <el-table-column property="submitDate" label="提交答卷时间" width="200" align="center"></el-table-column>
        <el-table-column property="content" label="答案文本"></el-table-column>
        <el-table-column label="查看答卷" width="100" align="center">
          <template slot-scope="scope">
            <el-button
              type="text"
              @click="openRecycleSurvey(scope.$index+(pageinfo.currentPage - 1) * pageinfo.pageSize + 1, scope.row.recycleId)"
            >查看答卷</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination
        background
        layout="prev, pager, next,sizes,total"
        :page-sizes="[5, 10, 15, 20]"
        :page-size="pageinfo.pageSize"
        :current-page="pageinfo.currentPage"
        :total="pageinfo.total"
        style="margin-top: 10px;"
        @current-change="textCurrentChange"
        @size-change="textSizeChange"
      ></el-pagination>
    </el-dialog>
  </div>
</template>

<script>
import QS from "qs";
import html2canvas from "html2canvas";

export default {
  data() {
    return {
      sums: [],
      surveyId: "",
      questions: {},
      rateAvgs: [],
      types: [
        { value: "radio", text: "[单选题]" },
        { value: "checkbox", text: "[多选题]" },
        { value: "textarea", text: "[文本题]" },
        { value: "rate", text: "[评分题]" }
      ],
      textareaData: [],
      currentTextId: "",
      textTitle: "",
      dialogTableVisible: false,
      pageinfo: {
        //每页数量
        pageSize: 5,
        //当前页
        currentPage: 1,
        //总数量
        total: 0
      },
      // charts
      charts: []
    };
  },

  filters: {
    typeFilter(value, types) {
      for (let i = 0; i < types.length; i++) {
        if (value == types[i].value) {
          return types[i].text;
        }
      }
    }
  },

  methods: {
    // 向服务器请求问卷信息
    getQuestions() {
      this.$http.post("recycle/detail/" + this.surveyId).then(res => {
        this.questions = res.data;
        // 设置统计报表的初始显示状态
        for (const key in this.questions) {
          this.$set(this.charts, key, 0);
        }
        // 算出总数用作百分数计算的分母
        for (const key in this.questions) {
          let sum = 0;
          const options = this.questions[key].options;
          if (options != null) {
            options.forEach(item => {
              sum += item.number;
            });
          }
          this.sums.push(sum);
        }
        // 算出平均评分
        for (const key in this.questions) {
          let avg = 0;
          const options = this.questions[key].options;
          if (options != null && this.questions[key].type == "rate") {
            options.forEach(item => {
              avg +=
                (Number(item.value) * Number(item.number)) / this.sums[key];
            });
          }
          this.rateAvgs.push(Number(avg.toFixed(1)));
        }
      });
    },

    lookTextDetail(title, id) {
      this.dialogTableVisible = true;
      this.currentTextId = id;
      this.textTitle = title;
      this.pageinfo.pageSize = 5;
      this.pageinfo.currentPage = 1;
      this.textPageQuery(id);
    },

    textPageQuery(id) {
      const data = {};
      data.questionId = id;
      data.page = this.pageinfo.currentPage;
      data.size = this.pageinfo.pageSize;
      this.$http
        .post("recycle/detail/textarea", QS.stringify(data))
        .then(res => {
          this.textareaData = res.data.list;
          this.pageinfo.total = res.data.count;
        });
    },

    //根据页码查询数据
    textCurrentChange(page) {
      this.pageinfo.currentPage = page;
      this.textPageQuery(this.currentTextId);
    },

    textSizeChange(pageSize) {
      this.pageinfo.pageSize = pageSize;
      this.pageinfo.currentPage = 1;
      this.textPageQuery(this.currentTextId);
    },

    // 打开新标签页查看答卷
    openRecycleSurvey(id, recycleId) {
      window.open(
        `#/view/recycle?id=${id}&recycleId=${recycleId}&surveyId=${this.surveyId}`
      );
    },
    /**
     * 柱形图
     */
    initColumnchart(item, index) {
      this.charts[index] != 1
        ? this.$set(this.charts, index, 1)
        : this.$set(this.charts, index, 0);
      if (this.charts[index] === 1) {
        const xdata = [];
        for (const key in item.options) {
          xdata.push(item.options[key].value);
        }
        const ydata = [];
        for (const key in item.options) {
          ydata.push(item.options[key].number);
        }
        this.$nextTick(() => {
          var myChart = this.$echarts.init(
            this.$refs["column" + index][0],
            "macarons"
          );
          let option = {
            xAxis: {
              type: "category",
              data: xdata
            },
            yAxis: {
              type: "value"
            },
            tooltip: {},
            series: [
              {
                data: ydata,
                barWidth: "30%",
                type: "bar",
                label: {
                  show: true,
                  position: "top"
                }
              }
            ],
            toolbox: {
              feature: {
                saveAsImage: {} // 保存为图片
              }
            }
          };
          // 绘制图表
          myChart.setOption(option);
        });
      }
    },
    /**
     * 饼状图
     */
    initPiechart(item, index) {
      this.charts[index] != 2
        ? this.$set(this.charts, index, 2)
        : this.$set(this.charts, index, 0);

      const value = [];
      for (const key in item.options) {
        value.push(item.options[key].value);
      }
      const data = [];
      for (const key in item.options) {
        const temp = {};
        temp.name = item.options[key].value;
        temp.value = item.options[key].number;
        data.push(temp);
      }
      if (this.charts[index] === 2) {
        this.$nextTick(() => {
          var myChart = this.$echarts.init(
            this.$refs["pie" + index][0],
            "macarons"
          );
          var option = {
            tooltip: {
              trigger: "item",
              formatter: "{b} : {c} ({d}%)"
            },
            legend: {
              orient: "horizontal",
              center: "center",
              data: value
            },
            series: [
              {
                type: "pie",
                radius: "55%",
                center: ["50%", "50%"],
                data: data,
                itemStyle: {
                  emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: "rgba(0, 0, 0, 0.5)"
                  }
                }
              }
            ],
            toolbox: {
              feature: {
                saveAsImage: {} // 保存为图片
              }
            }
          };
          // 绘制图表
          myChart.setOption(option);
        });
      }
    },
    /**
     * 环形图
     */
    initRingchart(item, index) {
      this.charts[index] != 3
        ? this.$set(this.charts, index, 3)
        : this.$set(this.charts, index, 0);

      const value = [];
      for (const key in item.options) {
        value.push(item.options[key].value);
      }
      const data = [];
      for (const key in item.options) {
        const temp = {};
        temp.name = item.options[key].value;
        temp.value = item.options[key].number;
        data.push(temp);
      }
      if (this.charts[index] === 3) {
        this.$nextTick(() => {
          var myChart = this.$echarts.init(
            this.$refs["ring" + index][0],
            "macarons"
          );
          var option = {
            tooltip: {
              trigger: "item",
              formatter: "{b}: {c} ({d}%)"
            },
            legend: {
              orient: "vertical",
              left: 10,
              data: value
            },
            series: [
              {
                type: "pie",
                radius: ["50%", "70%"],
                avoidLabelOverlap: false,
                label: {
                  normal: {
                    show: false,
                    position: "center"
                  },
                  emphasis: {
                    show: true,
                    textStyle: {
                      fontSize: "30",
                      fontWeight: "bold"
                    }
                  }
                },
                labelLine: {
                  normal: {
                    show: false
                  }
                },
                data: data
              }
            ],
            toolbox: {
              feature: {
                saveAsImage: {} // 保存为图片
              }
            }
          };
          // 绘制图表
          myChart.setOption(option);
        });
      }
    },
    /**
     * 条形图
     */
    initBarchart(item, index) {
      this.charts[index] != 4
        ? this.$set(this.charts, index, 4)
        : this.$set(this.charts, index, 0);
      if (this.charts[index] === 4) {
        const xdata = [];
        for (const key in item.options) {
          xdata.push(item.options[key].number);
        }
        const ydata = [];
        for (const key in item.options) {
          ydata.push(item.options[key].value);
        }
        this.$nextTick(() => {
          var myChart = this.$echarts.init(
            this.$refs["bar" + index][0],
            "macarons"
          );
          let option = {
            tooltip: {
              trigger: "axis",
              axisPointer: {
                type: "shadow"
              }
            },
            grid: {
              left: "3%",
              right: "4%",
              bottom: "3%",
              containLabel: true
            },
            xAxis: {
              type: "value",
              boundaryGap: [0, 0.01]
            },
            yAxis: {
              type: "category",
              data: ydata
            },
            series: [
              {
                type: "bar",
                barWidth: "50%",
                data: xdata
              }
            ],
            toolbox: {
              feature: {
                saveAsImage: {} // 保存为图片
              }
            }
          };
          // 绘制图表
          myChart.setOption(option);
        });
      }
    },
    dataURLToBlob(dataurl) {
      let arr = dataurl.split(",");
      let mime = arr[0].match(/:(.*?);/)[1];
      let bstr = atob(arr[1]);
      let n = bstr.length;
      let u8arr = new Uint8Array(n);
      while (n--) {
        u8arr[n] = bstr.charCodeAt(n);
      }
      return new Blob([u8arr], { type: mime });
    },
    /**
     * 保存为图片
     */
    saveAsImage(divText, imgText) {
      let canvasID = this.$refs[divText];
      let that = this;
      let a = document.createElement("a");
      html2canvas(canvasID).then(canvas => {
        let dom = document.body.appendChild(canvas);
        dom.style.display = "none";
        a.style.display = "none";
        document.body.removeChild(dom);
        let blob = that.dataURLToBlob(dom.toDataURL("image/jpg"));
        a.setAttribute("href", URL.createObjectURL(blob));
        //这块是保存图片操作  可以设置保存的图片的信息
        a.setAttribute("download", imgText + ".jpg");
        document.body.appendChild(a);
        a.click();
        URL.revokeObjectURL(blob);
        document.body.removeChild(a);
      });
    }
  },

  mounted() {
    this.surveyId = this.$route.query.surveyId;
    this.getQuestions();
  }
};
</script>

<style>
.recycle .el-progress__text {
  display: block;
}
.recycle table thead {
  background-color: #f5f7fa;
}
</style>
<style scoped>
.recycle {
  margin: 20px 0;
  width: 861px;
  margin-left: 100px;
}
.must {
  color: #ff6161;
}
.charts {
  height: 280px;
  padding-top: 20px;
  width: 100%;
  border: 1px solid #d6d6d6;
  border-radius: 10px;
  margin-top: 10px;
}
h4 {
  display: inline-block;
  margin-left: 5px;
}
.explain {
  color: #4f4f4f;
  font-size: 14px;
}
</style>