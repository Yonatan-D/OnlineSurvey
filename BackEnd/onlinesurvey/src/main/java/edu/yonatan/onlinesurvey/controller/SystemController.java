package edu.yonatan.onlinesurvey.controller;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.common.utils.Message;
import edu.yonatan.onlinesurvey.annotation.OnlyAdmin;
import edu.yonatan.onlinesurvey.annotation.UserLoginToken;
import edu.yonatan.onlinesurvey.config.UserRole;
import edu.yonatan.onlinesurvey.service.SurveyService;
import edu.yonatan.onlinesurvey.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
@RequestMapping("sys")
public class SystemController {
    @Autowired
    private UserService userService;
    @Autowired
    private SurveyService surveyService;

    /**
     * 获取系统相关数字
     * @return
     */
    @OnlyAdmin
    @PostMapping("counts")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getSystemStatusCounts() {
        Message message = new Message();
        try {
            Integer totalUser = userService.getUserCountByRole(UserRole.ROLE_NORMAL);
            Integer totalSurvey = surveyService.getSurveyCount();
            Integer curDayUser = userService.getCurDayUser();
            Integer curDaySurvey = surveyService.getCurDaySurvey();
            JSONObject counts = new JSONObject();
            counts.put("totalUser", totalUser);
            counts.put("totalSurvey", totalSurvey);
            counts.put("curDayUser", curDayUser);
            counts.put("curDaySurvey", curDaySurvey);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(counts);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }
}
