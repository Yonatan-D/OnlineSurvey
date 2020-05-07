<template>
  <div class="success">
    <div class="box">
      <el-card style="padding:20px;">
        <div class="page-endpic anim">
        <div class="page-endpic-paper">
          <span class="page-endpic-paper-line l1"></span>
          <span class="page-endpic-paper-line l2"></span>
          <span class="page-endpic-paper-line l3"></span>
          <span class="page-endpic-paper-line l4"></span>
          <span class="page-endpic-paper-line l5"></span>
          <span class="page-endpic-angle"></span>
          <span class="page-endpic-angle-shadow"></span>
          <span class="page-endpic-icon-shadow"></span>
        </div>
        <div class="page-endpic-icon page-endpic-icon_finish">
          <svg
            viewBox="-1 -1 72 72"
            id="icon-success"
            fill-rule="evenodd"
            width="100%"
            height="100%"
          >
            <path
              class="page-endpic-icon-circle"
              d="M35,0c19.33,0,35,15.67,35,35S54.33,70,35,70c-6.495,0-12.578-1.77-17.791-4.853c-2.477-1.465-14.098,1.741-14.098,1.741S6.856,55.979,5.43,53.733C1.991,48.316,0,41.891,0,35C0,15.67,15.67,0,35,0z"
            />
            <path
              class="page-endpic-icon-check"
              d="M27.515,44.729l21.214-21.214l4.242,4.243L31.757,48.971L27.515,44.729z"
            />
            <path
              class="page-endpic-icon-check"
              d="M19.029,36.242L23.272,32L36,44.729l-4.243,4.242L19.029,36.242z"
            />
          </svg>
        </div>
        </div>
        <div class="text">问卷到此结束，感谢您的参与</div>
        <el-button type="primary" @click="$router.go(-1)">返回问卷</el-button>
      </el-card>
    </div>
  </div>
</template>

<style scoped>
.success {
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
/* 问卷完成的图标动画 start */
/* 蓝色对勾 start */
.page-endpic-icon-circle{fill:rgba(40,99,243,1);}
.page-endpic-icon-check{fill:rgba(255,255,255,1);}
/* 蓝色对勾 end */
.page-endpic.anim .page-endpic-paper-line.l1,
.page-endpic.animated .page-endpic-paper-line.l1 {
  -webkit-animation: a-c-quote-1-line 0.2s 0.2s linear both;
          animation: a-c-quote-1-line 0.2s 0.2s linear both;
}
.page-endpic.anim .page-endpic-paper-line.l2,
.page-endpic.animated .page-endpic-paper-line.l2 {
  -webkit-animation: a-c-quote-1-line 0.2s 0.3s linear both;
          animation: a-c-quote-1-line 0.2s 0.3s linear both;
}
.page-endpic.anim .page-endpic-paper-line.l3,
.page-endpic.animated .page-endpic-paper-line.l3 {
  -webkit-animation: a-c-quote-1-line 0.2s 0.4s linear both;
          animation: a-c-quote-1-line 0.2s 0.4s linear both;
}
.page-endpic.anim .page-endpic-paper-line.l4,
.page-endpic.animated .page-endpic-paper-line.l4 {
  -webkit-animation: a-c-quote-1-line 0.2s 0.5s linear both;
          animation: a-c-quote-1-line 0.2s 0.5s linear both;
}
.page-endpic.anim .page-endpic-paper-line.l5,
.page-endpic.animated .page-endpic-paper-line.l5 {
  -webkit-animation: a-c-quote-1-line 0.2s 0.6s linear both;
          animation: a-c-quote-1-line 0.2s 0.6s linear both;
}
.page-endpic.anim .page-endpic-icon,
.page-endpic.animated .page-endpic-icon {
  -webkit-animation: a-e-icon-finish 0.3s 0.7s linear both, a-e-icon-finish-1 1.4s 1.2s linear infinite;
          animation: a-e-icon-finish 0.3s 0.7s linear both, a-e-icon-finish-1 1.4s 1.2s linear infinite;
}
.page-endpic {
  position: relative;
  width: 106px;
  height: 128px;
  margin: 0 auto;
}
.page-endpic-paper-line.l2 {
  top: 48px;
}
.page-endpic-paper-line.l3 {
  top: 60px;
}
.page-endpic-paper-line.l4 {
  top: 72px;
}
.page-endpic-paper-line.l5 {
  top: 84px;
  width: 34px;
}
.page-endpic-paper {
  position: relative;
  width: 106px;
  height: 128px;
  border-radius: 5px;
  filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0, startColorstr=#ebebeb, endColorstr=#d9d9d9);
  background: -webkit-gradient(linear, left top, left bottom, from(#ebebeb), to(#d9d9d9));
  background: linear-gradient(to bottom, #ebebeb 0%, #d9d9d9 100%);
}
.page-endpic-paper:before {
  content: "";
  position: absolute;
  right: 0;
  top: 0;
  width: 0;
  height: 0;
  border-top: 14px solid #f1f1f1;
  border-bottom: 14px solid #f7f7f7;
  border-left: 14px solid #f7f7f7;
  border-right: 14px solid #f1f1f1;
  border-bottom-left-radius: 3px;
}
.page-endpic-angle-shadow {
  position: absolute;
  top: 28px;
  right: 0;
  width: 0;
  height: 0;
  border-top: 12.5px solid #d8d8d8;
  border-bottom: 12.5px solid transparent;
  border-left: 12.5px solid transparent;
  border-right: 12.5px solid #d8d8d8;
}
.page-endpic-paper-line {
  position: absolute;
  left: 28px;
  top: 36px;
  width: 50px;
  height: 6px;
  background: #fff;
}
.page-endpic-icon {
  position: absolute;
  right: -28px;
  bottom: -25px;
  width: 56px;
  height: 56px;
  background-repeat: no-repeat;
  background-size: contain;
  z-index: 2;
}
@-webkit-keyframes a-e-paper {
  0% {
    opacity: 0;
    -webkit-transform: translate(0, 90px) scale(0.3, 0.5);
            transform: translate(0, 90px) scale(0.3, 0.5);
  }
  30% {
    opacity: 1;
    -webkit-transform: translate(0px, -10px) scale(1.1, 0.9);
            transform: translate(0px, -10px) scale(1.1, 0.9);
  }
  60% {
    opacity: 1;
    -webkit-transform: translate(0px, 5px) scale(0.95, 1.05);
            transform: translate(0px, 5px) scale(0.95, 1.05);
  }
  80% {
    opacity: 1;
    -webkit-transform: translate(0px, -4px) scale(1.02, 0.98);
            transform: translate(0px, -4px) scale(1.02, 0.98);
  }
  100% {
    opacity: 1;
    -webkit-transform: translate(0px, 0px) scale(1, 1);
            transform: translate(0px, 0px) scale(1, 1);
  }
}
@keyframes a-e-paper {
  0% {
    opacity: 0;
    -webkit-transform: translate(0, 90px) scale(0.3, 0.5);
            transform: translate(0, 90px) scale(0.3, 0.5);
  }
  30% {
    opacity: 1;
    -webkit-transform: translate(0px, -10px) scale(1.1, 0.9);
            transform: translate(0px, -10px) scale(1.1, 0.9);
  }
  60% {
    opacity: 1;
    -webkit-transform: translate(0px, 5px) scale(0.95, 1.05);
            transform: translate(0px, 5px) scale(0.95, 1.05);
  }
  80% {
    opacity: 1;
    -webkit-transform: translate(0px, -4px) scale(1.02, 0.98);
            transform: translate(0px, -4px) scale(1.02, 0.98);
  }
  100% {
    opacity: 1;
    -webkit-transform: translate(0px, 0px) scale(1, 1);
            transform: translate(0px, 0px) scale(1, 1);
  }
}
@-webkit-keyframes a-c-quote-1-line {
  0% {
    opacity: 0;
    -webkit-transform: translate(0, 1px) scale(0.9, 1);
            transform: translate(0, 1px) scale(0.9, 1);
  }
  50% {
    opacity: 1;
    -webkit-transform: translate(0, -1px) scale(1.1, 1);
            transform: translate(0, -1px) scale(1.1, 1);
  }
  100% {
    opacity: 1;
    -webkit-transform: translate(0, 0px) scale(1, 1);
            transform: translate(0, 0px) scale(1, 1);
  }
}
@keyframes a-c-quote-1-line {
  0% {
    opacity: 0;
    -webkit-transform: translate(0, 1px) scale(0.9, 1);
            transform: translate(0, 1px) scale(0.9, 1);
  }
  50% {
    opacity: 1;
    -webkit-transform: translate(0, -1px) scale(1.1, 1);
            transform: translate(0, -1px) scale(1.1, 1);
  }
  100% {
    opacity: 1;
    -webkit-transform: translate(0, 0px) scale(1, 1);
            transform: translate(0, 0px) scale(1, 1);
  }
}
@-webkit-keyframes a-e-icon-finish {
  0% {
    opacity: 0;
    -webkit-transform: scale(0.3, 0.5) translate(-3px, 23px);
            transform: scale(0.3, 0.5) translate(-3px, 23px);
  }
  30% {
    opacity: 1;
    -webkit-transform: scale(1.05, 1.03) translate(1px, 0px);
            transform: scale(1.05, 1.03) translate(1px, 0px);
  }
  60% {
    opacity: 1;
    -webkit-transform: scale(0.96, 0.98) translate(0px, 0px);
            transform: scale(0.96, 0.98) translate(0px, 0px);
  }
  80% {
    opacity: 1;
    -webkit-transform: scale(1.02, 1.01) translate(0px, 0px);
            transform: scale(1.02, 1.01) translate(0px, 0px);
  }
  100% {
    opacity: 1;
    -webkit-transform: scale(1, 1) translate(0px, 0px);
            transform: scale(1, 1) translate(0px, 0px);
  }
}
@keyframes a-e-icon-finish {
  0% {
    opacity: 0;
    -webkit-transform: scale(0.3, 0.5) translate(-3px, 23px);
            transform: scale(0.3, 0.5) translate(-3px, 23px);
  }
  30% {
    opacity: 1;
    -webkit-transform: scale(1.05, 1.03) translate(1px, 0px);
            transform: scale(1.05, 1.03) translate(1px, 0px);
  }
  60% {
    opacity: 1;
    -webkit-transform: scale(0.96, 0.98) translate(0px, 0px);
            transform: scale(0.96, 0.98) translate(0px, 0px);
  }
  80% {
    opacity: 1;
    -webkit-transform: scale(1.02, 1.01) translate(0px, 0px);
            transform: scale(1.02, 1.01) translate(0px, 0px);
  }
  100% {
    opacity: 1;
    -webkit-transform: scale(1, 1) translate(0px, 0px);
            transform: scale(1, 1) translate(0px, 0px);
  }
}
@-webkit-keyframes a-e-icon-finish-1 {
  0% {
    -webkit-transform: scale(1, 1) translate(0, 0) rotate(0deg);
            transform: scale(1, 1) translate(0, 0) rotate(0deg);
  }
  30% {
    -webkit-transform: scale(1, 1) translate(-1px, 0) rotate(-1deg);
            transform: scale(1, 1) translate(-1px, 0) rotate(-1deg);
  }
  60% {
    -webkit-transform: scale(1, 1) translate(0px, 0) rotate(1deg);
            transform: scale(1, 1) translate(0px, 0) rotate(1deg);
  }
  80% {
    -webkit-transform: scale(1, 1) translate(-1px, 0) rotate(-0.5deg);
            transform: scale(1, 1) translate(-1px, 0) rotate(-0.5deg);
  }
  100% {
    -webkit-transform: scale(1, 1) translate(0, 0) rotate(0deg);
            transform: scale(1, 1) translate(0, 0) rotate(0deg);
  }
}
@keyframes a-e-icon-finish-1 {
  0% {
    -webkit-transform: scale(1, 1) translate(0, 0) rotate(0deg);
            transform: scale(1, 1) translate(0, 0) rotate(0deg);
  }
  30% {
    -webkit-transform: scale(1, 1) translate(-1px, 0) rotate(-1deg);
            transform: scale(1, 1) translate(-1px, 0) rotate(-1deg);
  }
  60% {
    -webkit-transform: scale(1, 1) translate(0px, 0) rotate(1deg);
            transform: scale(1, 1) translate(0px, 0) rotate(1deg);
  }
  80% {
    -webkit-transform: scale(1, 1) translate(-1px, 0) rotate(-0.5deg);
            transform: scale(1, 1) translate(-1px, 0) rotate(-0.5deg);
  }
  100% {
    -webkit-transform: scale(1, 1) translate(0, 0) rotate(0deg);
            transform: scale(1, 1) translate(0, 0) rotate(0deg);
  }
}


/* 问卷完成的图标动画 end */
</style>