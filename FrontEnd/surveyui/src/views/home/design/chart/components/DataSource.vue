<template>
  <div style="margin-top: 20px;">
    <el-row :gutter="10">
      <el-col :span="12">
        <el-card class="box-card">
          <div style="height: 300px;width: 100%;" ref="map"></div>
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-card class="box-card">
          <div style="height: 300px;width: 100%;" ref="sourceCharts"></div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  data() {
    return {
      dataSource: [],
      mapData: []
    };
  },

  methods: {
    initMapCharts() {
      // 基于准备好的dom，初始化echarts实例
      var myChart = this.$echarts.init(this.$refs.map, "macarons");
      let option = {
        title: {
          text: "地域位置",
          x: "left"
        },
        tooltip: {
          show: true,
          formatter: function(params) {
            if(params.value) {
              return params.name + "：" + params.value;
            } else {
              return params.name + "：" + "0";
            }
          }
        },
        visualMap: {
          show: false,
          inRange: {
            color: ["#C6E2FF", "#409EFF"]
          }
        },
        geo: {
          roam: false, //禁止缩放
          map: "china",
          left: "left",
          right: "0",
          layoutSize: "50",
          label: {
            emphasis: {
              show: false
            }
          },
          itemStyle: {
            emphasis: {
              areaColor: "#409EFF"
            }
          },
          regions: [
            {
              name: "南海诸岛",
              value: 0,
              itemStyle: {
                normal: {
                  opacity: 1,
                  label: {
                    show: false
                  }
                }
              }
            }
          ]
        },
        series: [
          {
            name: "地域位置",
            type: "map",
            roam: false,
            geoIndex: 0,
            label: {
              show: false
            },
            data: this.mapData
          }
        ]
      };

      // 绘制图表
      myChart.setOption(option);
    },
    
    initSourceCharts() {
      // 基于准备好的dom，初始化echarts实例
      var myChart = this.$echarts.init(this.$refs.sourceCharts, "macarons");
      var option = {
        title: {
          text: "渠道来源",
          x: "left"
        },
        tooltip: {
          trigger: "item",
          formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
          orient: "vertical",
          left: "right",
          data: ["二维码", "微信", "链接"]
        },
        series: [
          {
            name: "渠道来源",
            type: "pie",
            radius: "55%",
            center: ["50%", "60%"],
            data: this.dataSource,
            itemStyle: {
              emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: "rgba(0, 0, 0, 0.5)"
              }
            }
          }
        ]
      };
      // 绘制图表
      myChart.setOption(option);
    },

    getDataSource() {
      this.$http
        .get(`/recycle/data_source/${this.$route.query.surveyId}`)
        .then(res => {
          this.dataSource = res.data;
          this.initSourceCharts();
        });
    },

    getMapData() {
      this.$http
        .get(`/recycle/map/${this.$route.query.surveyId}`)
        .then(res => {
          this.mapData = res.data;
          this.initMapCharts();
        });
    }
  },
  mounted() {
    this.getDataSource();
    this.getMapData();
  }
};
</script>
