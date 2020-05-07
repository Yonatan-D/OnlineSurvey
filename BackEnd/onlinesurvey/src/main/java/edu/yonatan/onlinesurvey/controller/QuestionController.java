package edu.yonatan.onlinesurvey.controller;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.common.utils.Message;
import edu.yonatan.onlinesurvey.annotation.UserLoginToken;
import edu.yonatan.onlinesurvey.entity.Question;
import edu.yonatan.onlinesurvey.entity.Survey;
import edu.yonatan.onlinesurvey.service.QuestionService;
import edu.yonatan.onlinesurvey.service.SurveyService;
import edu.yonatan.onlinesurvey.vo.QuestionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("question")
public class QuestionController {
    @Autowired
    private QuestionService questionService;
    @Autowired
    private SurveyService surveyService;

    /**
     * 保存修改的题目
     * @param questionVO
     * @return
     */
    @UserLoginToken
    @PostMapping("/save")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message saveQuestion(@RequestBody QuestionVO questionVO) {
        Message message = new Message();
        try {
            questionService.saveQuestionOfEdit(questionVO);
            // 更新问卷的修改时间
            Survey survey = new Survey();
            survey.setId(questionVO.getSurveyId());
            survey.setUpdateDate(new Date());
            surveyService.modifySurveyInfoOfEdit(survey);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(new ArrayList<>());
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 保存新增的题目
     * @param questionVO
     * @return
     */
    @UserLoginToken
    @PostMapping("/new")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message saveNewQuestion(@RequestBody QuestionVO questionVO) {
        Message message = new Message();
        try {
            // 新增题库
            String qsItemId = questionService.saveQuestionOfNew(questionVO);
            // 新增题目记录
            Question question = new Question();
            String id = UUID.randomUUID().toString().replaceAll("-","");
            question.setId(id);
            question.setQsItemId(qsItemId);
            question.setType(questionVO.getType());
            question.setSurveyId(questionVO.getSurveyId());
            question.setOrderId(questionVO.getOrderId());
            question.setIsRequired(questionVO.getIsRequired());
            questionService.addQuestion(question);
            // 更新问卷的题目总数和修改时间
            Survey survey = new Survey();
            survey.setId(questionVO.getSurveyId());
            survey.setNumber(questionVO.getNumber());
            survey.setUpdateDate(new Date());
            surveyService.modifySurveyInfoOfEdit(survey);
            message.setCode("200");
            message.setMsg("ok");
            JSONObject qsItem = new JSONObject();
            qsItem.put("id", id);
            qsItem.put("qsItemId", qsItemId);
            message.setData(qsItem);
        }catch (Exception e) {
            throw e;
        }
        return message;
    }

//    /**
//     * 修改模板题目创建新的题库
//     * @param questionVOS
//     * @return
//     */
//    @UserLoginToken
//    @PostMapping("/new/temp")
//    @CrossOrigin
//    @Transactional(rollbackFor = Exception.class)
//    public Message modifyTemplateQuestion(@RequestBody List<QuestionVO> questionVOS) {
//        Message message = new Message();
//        try {
//            for (QuestionVO qu:questionVOS
//                 ) {
//                // 复制原题及选项
//                String qsItemId = questionService.saveQuestionOfNew(qu);
//                // 更新题库编号
//                Question question = new Question();
//                question.setId(qu.getId());
//                question.setQsItemId(qsItemId);
//                questionService.modifyQuestion(question);
//            }
//            // 取消问卷引用
//            String surveyId = questionVOS.get(0).getSurveyId();
//            String originId = surveyService.findOriginId(surveyId);
//            surveyService.reduceQuote(originId); // 原卷引用数减1
//            surveyService.removeReferenceTo(surveyId); // 移除本卷的引用编号
//            message.setCode("200");
//            message.setMsg("ok");
//            message.setData(new ArrayList<>());
//        } catch (Exception e) {
//            throw e;
//        }
//        return message;
//    }

    /**
     * 删除问卷的题目
     * @param questionVO
     * @return
     */
    @UserLoginToken
    @PostMapping("/del")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message delQuestion(@RequestBody QuestionVO questionVO) {
        Message message = new Message();
        try {
            questionService.deleteQuestion(questionVO.getId());
            // 若删除的不是引用或被引用，就彻底删除
            String surveyId = questionVO.getSurveyId();
//            boolean isQuote = surveyService.isQuote(surveyId);
//            boolean isReference = surveyService.isReference(surveyId);
//            if(!isReference & !isQuote) {
                String type = questionVO.getType();
                String qsItemId = questionVO.getQsItemId();
                questionService.deleteQsAndAn(type, qsItemId);
//            }
            // 更新问卷的题目总数
            Survey survey = new Survey();
            survey.setId(surveyId);
            survey.setNumber(questionVO.getNumber());
            surveyService.modifySurveyInfoOfEdit(survey);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(new ArrayList<>());
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 交换题目位置
     * @param fromId
     * @param fromOid
     * @param toId
     * @param toOid
     * @return
     */
    @UserLoginToken
    @PostMapping("/swap")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message swapQuestion(@RequestParam String fromId, @RequestParam Integer fromOid,
                                @RequestParam String toId, @RequestParam Integer toOid) {
        Message message = new Message();
        try {
            // from
            Question fromQuestion = new Question();
            fromQuestion.setId(fromId);
            fromQuestion.setOrderId(fromOid);
            // to
            Question toQuestion = new Question();
            toQuestion.setId(toId);
            toQuestion.setOrderId(toOid);
            // swap
            questionService.swapQuestionOrderId(fromQuestion, toQuestion);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(new ArrayList<>());
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 题目跳到指定位置（最前或最后）
     * @param id
     * @param orderId
     * @return
     */
    @UserLoginToken
    @PostMapping("/jump")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message jumpQuestion(@RequestParam String id, @RequestParam Integer orderId) {
        Message message = new Message();
        try {
            Question question = new Question();
            question.setId(id);
            question.setOrderId(orderId);
            questionService.modifyQuestion(question);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(new ArrayList<>());
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 题目重新排序
     * @param questions
     * @return
     */
    @UserLoginToken
    @PostMapping("/reorder")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message QuestionReOrder(@RequestBody List<Question> questions) {
        Message message = new Message();
        try {
            for (int index = 0, orderId = 1000; index < questions.size(); index++, orderId++) {
                questions.get(index).setOrderId(orderId);
                questionService.modifyQuestion(questions.get(index));
            }
            message.setCode("200");
            message.setMsg("ok");
            message.setData(new ArrayList<>());
        } catch (Exception e) {
            throw e;
        }
        return message;
    }
}
