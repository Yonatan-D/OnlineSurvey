<template>
  <div class="noFind">
    <div class="box">
      <el-card>
        <div class="text">
          <i class="icon el-icon-document-delete"></i>
          <p><strong>非常抱歉，没有找到问卷</strong></p>
        </div>
      </el-card>
    </div>
  </div>
</template>

<style scoped>
.close {
  padding: 20px;
}
.box {
  width: 500px;
  max-width: 100%;
  margin: 10% auto;
  text-align: center;
}
.box .text {
  margin: 50px 0;
  color: #4e4e4e;
  font-size: 18px;
  font-weight: 500;
}
.icon {
  color: #FA6161;
  font-size: 45px;
}
</style>