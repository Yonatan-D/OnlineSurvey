// 日期格式化
Date.prototype.format = function(fmt){
    var o = {
      "M+" : this.getMonth()+1,                 //月份
      "d+" : this.getDate(),                    //日
      "h+" : this.getHours(),                   //小时
      "m+" : this.getMinutes(),                 //分
      "s+" : this.getSeconds(),                 //秒
      "q+" : Math.floor((this.getMonth()+3)/3), //季度
      "S"  : this.getMilliseconds()             //毫秒
    };
  
    if(/(y+)/.test(fmt)){
      fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }
          
    for(var k in o){
      if(new RegExp("("+ k +")").test(fmt)){
        fmt = fmt.replace(
          RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));  
      }       
    }
  
    return fmt;
  }
  
  // 计算出间隔时间
  Date.prototype.getDateDiff = function(dt){
    var minute = 1000 * 60;      //把分，时，天，周，半个月，一个月用毫秒表示
    var hour = minute * 60;
    var day = hour * 24;
    var week = day * 7;
    // var halfamonth = day * 15;
    var month = day * 30;
    var now = new Date().getTime();   //获取当前时间毫秒
    var diffValue = now - dt;//时间差
  
    if(diffValue < 0){
        return;
    }
    var minC = diffValue/minute;  //计算时间差的分，时，天，周，月
    var hourC = diffValue/hour;
    var dayC = diffValue/day;
    var weekC = diffValue/week;
    var monthC = diffValue/month;
    if(monthC >= 1 && monthC <= 3){
      dt = " " + parseInt(monthC) + "月前"
    }else if(weekC >= 1 && weekC <= 3){
      dt = " " + parseInt(weekC) + "周前"
    }else if(dayC >= 1 && dayC <= 6){
      dt = " " + parseInt(dayC) + "天前"
    }else if(hourC >= 1 && hourC <= 23){
      dt = " " + parseInt(hourC) + "小时前"
    }else if(minC >= 1 && minC <= 59){
      dt =" " + parseInt(minC) + "分钟前"
    }else if(diffValue >= 0 && diffValue <= minute){
      dt = "刚刚"
    }else {
        var datetime = new Date();
        datetime.setTime(dt);
        var Nyear = datetime.getFullYear();
        var Nmonth = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var Ndate = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
        dt = Nyear + "-" + Nmonth + "-" + Ndate
    }
    return dt;
  }