package edu.yonatan.onlinesurvey.service;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.onlinesurvey.entity.Question;
import edu.yonatan.onlinesurvey.vo.QuestionVO;

import java.util.List;

public interface QuestionService {
    // 获取题目VO类
    QuestionVO getQuestionVO(Question question);
    // 获取题目VO类列表
    List<QuestionVO> getQuestionVOs(String surveyId);
    // 获取题目的标题和选项
    JSONObject getQsItem(String type, String qsItemId);
    // 获取题目记录
    List<Question> getQuestions(String surveyId);
    // 保存题库的题目和选项
    void saveQuestionOfEdit(QuestionVO questionVO);
    // 新建题库的题目和选项
    String saveQuestionOfNew(QuestionVO questionVO);
    // 删除题目记录
    void deleteQuestion(String questionId);
    // 删除题库的题目和选项
    void deleteQsAndAn(String type, String qsItemId);
    // 新增题目记录
    void addQuestion(Question question);
    // 修改题目记录
    void modifyQuestion(Question question);
    // 交换题目位置
    void swapQuestionOrderId(Question fromQuestion, Question toQuestion);
}
