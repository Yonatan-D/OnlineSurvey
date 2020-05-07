package edu.yonatan.onlinesurvey.controller;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.common.utils.Message;
import edu.yonatan.onlinesurvey.annotation.UserLoginToken;
import edu.yonatan.onlinesurvey.entity.QuestionBank;
import edu.yonatan.onlinesurvey.service.QuestionBankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
public class QuestionBankController {
    @Autowired
    private QuestionBankService questionBankService;

    /**
     * 收藏题目
     * @param questionBank
     * @return
     */
    @UserLoginToken
    @PostMapping("star_question")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message starQuestion(@RequestBody QuestionBank questionBank) {
        Message message = new Message();
        try {
            String qsItemId = questionBankService.starQuestion(questionBank);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(qsItemId);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 将题目移出收藏
     * @param type
     * @param qsItemId
     * @return
     */
    @UserLoginToken
    @PostMapping("remove_star_question")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message removeStarQuestion(@RequestParam String type, @RequestParam String qsItemId) {
        Message message = new Message();
        try {
            questionBankService.removeQuestion(type, qsItemId);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(new ArrayList<>());
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 获取用户收藏的题库列表
     * @param belongId
     * @return
     */
    @UserLoginToken
    @PostMapping("question_user_list_get/{belongId}")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getUserQuestionList(@PathVariable String belongId) {
        Message message = new Message();
        try {
            JSONObject userQuestionList = questionBankService.getUserQuestionList(belongId);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(userQuestionList);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 获取系统题库列表
     * @return
     */
    @UserLoginToken
    @PostMapping("question_system_list_get")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getSystemQuestionList() {
        Message message = new Message();
        try {
            JSONObject systemQuestionList = questionBankService.getSystemQuestionList();
            message.setCode("200");
            message.setMsg("ok");
            message.setData(systemQuestionList);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }
}
