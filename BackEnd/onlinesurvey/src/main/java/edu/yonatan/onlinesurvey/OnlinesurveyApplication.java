package edu.yonatan.onlinesurvey;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("edu.yonatan.onlinesurvey.dao")
public class OnlinesurveyApplication {

    public static void main(String[] args) {
        SpringApplication.run(OnlinesurveyApplication.class, args);
    }

}
