FROM centos:7
MAINTAINER yonatan <yonatan.lin@outlook.com>
ENV SURVEY_VERSION v1.0.0

ENV TIME_ZONE Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone

RUN yum install -y epel-release && yum update -y \
    && yum install -y nginx \
    && rm -rf /usr/share/nginx/html/* \
    && yum clean all \
    && rm -rf /var/cache/yum/*

WORKDIR /usr/local/java
RUN curl -LO https://download.java.net/openjdk/jdk13/ri/openjdk-13+33_linux-x64_bin.tar.gz \
    && tar zxvf openjdk-13+33_linux-x64_bin.tar.gz --strip-components 1 \
    && rm -f openjdk-13+33_linux-x64_bin.tar.gz \
    && ln -s /usr/local/java/bin/java /usr/bin/java

WORKDIR /app
RUN RELEASES_NAME=onlinesurvey-${SURVEY_VERSION} \
    && curl -LO https://github.com/Yonatan-D/OnlineSurvey/releases/download/${SURVEY_VERSION}/${RELEASES_NAME}.tar.gz \
    && tar zxvf ${RELEASES_NAME}.tar.gz --strip-components 1 \
    && rm -f ${RELEASES_NAME}.tar.gz \
    && cp -r dist/* /usr/share/nginx/html \
    && cp nginx.conf /etc/nginx/conf.d/default.conf \
    && chmod +x start.sh 

EXPOSE 80
ENTRYPOINT ["/app/start.sh"]
