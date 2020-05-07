package edu.yonatan.onlinesurvey.service;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.onlinesurvey.entity.QuestionBank;

public interface QuestionBankService {
    // 收藏题目
    String starQuestion(QuestionBank questionBank);
    // 将题目移出收藏
    void removeQuestion(String type, String qsItemId);
    // 获取题库列表
    JSONObject getQuestionList(String belongId);
    // 获取用户收藏的题库列表
    JSONObject getUserQuestionList(String belongId);
    // 获取系统题库列表
    JSONObject getSystemQuestionList();
}
