package edu.yonatan.onlinesurvey.service.impl;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.onlinesurvey.dao.QuestionBankMapper;
import edu.yonatan.onlinesurvey.entity.Question;
import edu.yonatan.onlinesurvey.entity.QuestionBank;
import edu.yonatan.onlinesurvey.service.QuestionBankService;
import edu.yonatan.onlinesurvey.service.QuestionService;
import edu.yonatan.onlinesurvey.vo.QuestionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class QuestionBankServiceImpl implements QuestionBankService {
    @Autowired
    private QuestionBankMapper questionBankMapper;
    @Autowired
    private QuestionService questionService;

    /**
     * 收藏题目
     * @param questionBank
     */
    @Override
    public String starQuestion(QuestionBank questionBank) {
        String qsItemId = "";
        // 复制题目和选项
        Question question = new Question();
        question.setQsItemId(questionBank.getQsItemId());
        question.setType(questionBank.getType());
        QuestionVO questionVO = questionService.getQuestionVO(question);
        qsItemId = questionService.saveQuestionOfNew(questionVO);
        // 添加到题库表的收藏分组
        questionBank.setId(UUID.randomUUID().toString().replaceAll("-",""));
        questionBank.setFolder("我的收藏");
        questionBank.setQsItemId(qsItemId);
        questionBankMapper.insertQuestionBank(questionBank);
        return qsItemId;
    }

    /**
     * 将题目移出收藏
     */
    @Override
    public void removeQuestion(String type, String qsItemId) {
        questionBankMapper.deleteQuestionBank(qsItemId);
        questionService.deleteQsAndAn(type, qsItemId);
    }

    /**
     * 获取题库列表
     * @param belongId
     */
    @Override
    public JSONObject getQuestionList(String belongId) {
        JSONObject list = new JSONObject();
        JSONObject group = new JSONObject();
        List<JSONObject> questionList = new ArrayList<>();
        List<QuestionBank> questionBankList = questionBankMapper.selectQuestionBankGroup(belongId);
        for (QuestionBank questionBank:questionBankList
        ) {
            // 分组列表
            String folder = questionBank.getFolder();
            String[] qsItemIds = questionBank.getQsItemIds().split(",");
            group.put(folder, qsItemIds);
            // 题目列表
            for (String qsItemId:qsItemIds
                 ) {
                JSONObject question = new JSONObject();
                question.put("qsItemId", qsItemId);
                String type = questionBankMapper.findTypeByQsItemId(qsItemId);
                JSONObject content = questionService.getQsItem(type, qsItemId);
                question.put("content", content);
                questionList.add(question);
            }
        }
        list.put("group_list", group);
        list.put("question_list", questionList);
        return list;
    }

    /**
     * 获取用户收藏的题库列表
     * @param belongId
     */
    @Override
    public JSONObject getUserQuestionList(String belongId) {
        return this.getQuestionList(belongId);
    }

    /**
     * 获取系统题库列表
     */
    @Override
    public JSONObject getSystemQuestionList() {
        return this.getQuestionList("admin");
    }
}
