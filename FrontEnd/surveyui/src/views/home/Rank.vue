<template>
  <div class="hot">
    <div class="rank">
      <el-row :gutter="20">
        <el-col :span="6">
          <div class="grid-content">
            <el-card><h3>最多使用</h3></el-card>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="grid-content">
            <el-card><h3>最多回收</h3></el-card>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="grid-content">
            <el-card><h3>最新发布</h3></el-card>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="grid-content">
            <el-card><h3>最新修改</h3></el-card>
          </div>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<style scoped>
.hot {
  position: fixed;
  top: 60px;
  left: 0px;
  bottom: 0px;
  right: 0px;
  width: 100%;
  height: calc(100%-60px);
  overflow-x: hidden;
  overflow-y: scroll;
  background-color: #f4f6f9;
}
.rank {
  width: 80%;
  margin: 35px auto;
}
.el-row {
  margin-bottom: 20px;
}
.el-col {
  border-radius: 4px;
}
.grid-content {
  border-radius: 4px;
  min-height: 36px;
}
h3 {
  margin: 0;
  color: #79BBFF;
}
</style>
