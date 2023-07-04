# OnlineSurvey

2020毕设，在线问卷调查网站

演示地址 (Demo)：https://survey.yonatan.cn/

> 用户账号/密码：demo / 202005  
> 管理员账号/密码：admin / 123456



## 功能介绍

- 创建问卷：创建空白或模板问卷，模板来自系统内其他用户公开的问卷

- 编辑问卷：提供常见题型组件和题库，支持拖拽排序，实时查看问卷大纲和问卷预览（PC、Phone布局）

- 投放问卷：网页链接或二维码两种方式分享问卷

- 统计问卷：统计了问卷的回收概况（回收率、平均用时)，问卷来源（IP、省份、设备、何种分享方式）和每题的填写情况（统计图），支持选择问卷上的两道单选题进行交叉分析

- 数据导出：报表下载（JPG），问卷打印（PDF）



## 开发环境

- jdk 13
- Spring Boot
- mysql 8
- node v12.14.1
- vue 2

> 开发工具：IntelliJ IDEA 2019.3.1 x64 | Visual Studio Code 1.45.1 | Google Chrome 81.0.4044.138



## 部署运行

```bash
$ docker-compose up -d
```

或者

```bash
$ docker pull yont/onlinesurvey:v1.0.0

$ docker run -dt --name onlinesurvey --restart always \
             -p 39101:80 \
             -e MYSQL_HOST="192.168.35.88" \
             -e MYSQL_USER="root" 
             -e MYSQL_PASSWORD="123456" \
  yont/onlinesurvey:v1.0.0
```

- `MYSQL_HOST` : mysql 数据库主机名/IP
- `MYSQL_PORT` : mysql 数据库端口, 默认是3306
- `MYSQL_USER` : mysql 用户名
- `MYSQL_PASSWORD` : mysql 密码



## 开发准备

1. 创建名称为 “surveydb” 的数据库，导入 surveydb.sql 文件。

2. 打开 onlinesurvey 项目，修改数据库连接信息，启动项目。默认配置如下：

    ```properties
    # 配置文件： onlinesurvey/src/main/resources/application.properties 
    spring.datasource.url=jdbc:mysql://localhost:3306/surveydb?serverTimezone=GMT%2B8
    spring.datasource.username=root
    spring.datasource.password=mysql
    spring.datasource.driver-class-name=com.mysql.jdbc.Driver
    ```
    
1. 打开 surveyui 项目，在文件夹下运行 npm install 构建依赖，运行 npm run serve 启动项目。默认请求头如下：
	```js
	// 默认接口和域名: surveyui/src/request/http.js 
   axios.defaults.baseURL = "http://localhost:39000";
   const domain = axios.defaults.domain = "http://localhost:8080"
   ```
   
   > baseURL 配置成 api，开发时(dev 模式)，用 vue.config.js -> devServer -> proxy 做代理；部署时，用 nginx 转发
   >
   > domain 是域名，用于生成问卷预览地址
   
4. 打开浏览器访问 http://localhost:8080 

    管理员：admin / 123456
    普通用户：demo / 202005


