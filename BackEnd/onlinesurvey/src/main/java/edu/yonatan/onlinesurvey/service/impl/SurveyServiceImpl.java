package edu.yonatan.onlinesurvey.service.impl;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.onlinesurvey.dao.*;
import edu.yonatan.onlinesurvey.entity.*;
import edu.yonatan.onlinesurvey.service.QuestionService;
import edu.yonatan.onlinesurvey.service.SurveyService;
import edu.yonatan.onlinesurvey.vo.QuestionVO;
import edu.yonatan.onlinesurvey.vo.RecycleAnswerVO;
import edu.yonatan.onlinesurvey.vo.SurveyListVO;
import edu.yonatan.onlinesurvey.vo.SurveyVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class SurveyServiceImpl implements SurveyService {
    @Autowired
    private SurveyMapper surveyMapper;
    @Autowired
    private SurveyRecycleMapper surveyRecycleMapper;
    @Autowired
    private AnswerMapper answerMapper;
    @Autowired
    private QuestionService questionService;

    /**
     * 获取整份问卷
     * @param id
     * @return
     */
    @Override
    public SurveyVO getSurveyVOById(String id) {
        SurveyVO surveyVO = surveyMapper.selectSurveyToVOById(id);
        List<QuestionVO> questionVOs = questionService.getQuestionVOs(id);
        surveyVO.setQsitems(questionVOs);
        return surveyVO;
    }

    /**
     * 获取用户的问卷列表
     * @param creator
     * @return
     */
    @Override
    public List<SurveyListVO> getSurveysByCreator(String creator) {
        List<SurveyListVO> surveyList = surveyMapper.selectSurveysByCreator(creator);
        for (SurveyListVO surveyListVO:surveyList
             ) {
            Integer recycle = surveyRecycleMapper.selectRecyclesCount(surveyListVO.getId());
            surveyListVO.setRecycle(recycle);
        }
        return surveyList;
    }

    /**
     * 获取问卷信息
     * @param surveyId
     * @return
     */
    @Override
    public Survey getSurvey(String surveyId) {
        return surveyMapper.selectSurvey(surveyId);
    }

    /**
     * 提交填写问卷
     * @param recycleAnswerVO
     */
    @Override
    public void saveSurveyOfRecycle(RecycleAnswerVO recycleAnswerVO) {
        String recycleId = UUID.randomUUID().toString().replaceAll("-","");
        SurveyRecycle surveyRecycle = recycleAnswerVO.getSurveyRecycle();
        surveyRecycle.setId(recycleId);
        surveyRecycleMapper.saveRecycleSurvey(surveyRecycle);

        for (Answer an:recycleAnswerVO.getAnswers()
             ) {
            String[] contentArray = null;
            if (an.getType().equals("checkbox")) {
                String contentString = an.getContent().toString();
                // 正则去掉中括号
                Pattern pattern = Pattern.compile("\\[(.*?)\\]");
                Matcher matcher = pattern.matcher(contentString);
                while (matcher.find()) {
                    contentString = matcher.group(1);
                }
                // 以逗号切割字符串
                contentArray = contentString.split(",");
            } else {
                String content = an.getContent().toString();
                contentArray = new String[1];
                contentArray[0] = content;
            }
            for (String content:contentArray
            ) {
                Answer answer = new Answer();
                String answerId = UUID.randomUUID().toString().replaceAll("-","");
                answer.setId(answerId);
                answer.setRecycleId(recycleId);
                answer.setQuestionId(an.getQuestionId());
                answer.setType(an.getType());
                answer.setContent(content.trim());
                answerMapper.saveAnswer(answer);
            }
        }
        // 更新问卷的预计答题时间
        Integer totalTimeAvg = surveyRecycleMapper.selectAvgTotalTime(surveyRecycle.getSurveyId());
        Survey survey = new Survey();
        survey.setId(surveyRecycle.getSurveyId());
        survey.setTotalTime(totalTimeAvg);
        surveyMapper.updateSurveyById(survey);
    }

    /**
     * 修改问卷信息
     * @param survey
     */
    @Override
    public void modifySurveyInfoOfEdit(Survey survey) {
        surveyMapper.updateSurveyById(survey);
    }

    /**
     * 新建空白问卷
     * @param creator
     * @return
     */
    public String newBlankSurvey(String creator) {
        String surveyId = UUID.randomUUID().toString().replaceAll("-","");
        Survey survey = new Survey();
        survey .setId(surveyId);
        survey.setTitle("问卷标题");
        survey.setIntroduction("为了给您提供更好的服务，希望您能抽出几分钟时间，" +
                "将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您" +
                "的参与！现在我们就马上开始吧！");
        survey.setNumber(0);
        survey.setTotalTime(0);
        survey.setCreator(creator);
        survey.setUpdateDate(new Date());
        surveyMapper.insertSurvey(survey);
        return surveyId;
    }

    /**
     * 创建模板问卷-A-引用问卷
     * @param surveyId
     * @return
     */
    @Override
    public String quoteTemplateSurvey(String surveyId, String creator) {
        // 拷贝模板信息到新的问卷
        Survey survey = surveyMapper.selectSurveyOfTemplate(surveyId);
        String newSurveyId = UUID.randomUUID().toString().replaceAll("-","");
        survey.setReferenceTo(survey.getId());
        survey.setId(newSurveyId);
        survey.setCreator(creator);
        survey.setUpdateDate(new Date());
        surveyMapper.insertSurvey(survey);
        // 拷贝模板题目
        List<Question> questions = questionService.getQuestions(surveyId);
        for (Question qu:questions
             ) {
            String id = UUID.randomUUID().toString().replaceAll("-","");
            qu.setId(id);
            qu.setSurveyId(newSurveyId);
            questionService.addQuestion(qu);
        }
        return newSurveyId;
    }

    /**
     * 创建模板问卷-B-创建新问卷
     * @param surveyId
     * @param creator
     * @return
     */
    @Override
    public String newTemplateSurvey(String surveyId, String creator) {
        // 拷贝模板信息到新的问卷
        Survey survey = surveyMapper.selectSurveyOfTemplate(surveyId);
        String newSurveyId = UUID.randomUUID().toString().replaceAll("-","");
        survey.setId(newSurveyId);
        survey.setCreator(creator);
        survey.setTitle(survey.getTitle()+"_副本");
        survey.setUpdateDate(new Date());
        surveyMapper.insertSurvey(survey);
        // 拷贝模板题目
        List<QuestionVO> questionVOS = questionService.getQuestionVOs(surveyId);
        for (QuestionVO qu:questionVOS
        ) {
            // 复制原题及选项
            String qsItemId = questionService.saveQuestionOfNew(qu);
            // 更新题库编号
            Question question = new Question();
            question.setId(UUID.randomUUID().toString().replaceAll("-",""));
            question.setQsItemId(qsItemId);
            question.setSurveyId(newSurveyId);
            question.setType(qu.getType());
            question.setIsRequired(qu.getIsRequired());
            question.setOrderId(qu.getOrderId());
            questionService.addQuestion(question);
        }
        return newSurveyId;
    }

    /**
     * 删除问卷
     * @param id
     */
    @Override
    public void deleteSurveyById(String id) {
        // 若使用的是模板问卷，原问卷引用数需减1
        String originId = surveyMapper.selectReferenceToById(id);
        if(originId != null) {
            surveyMapper.updateQuoteDecreased(originId);
            // 当引用数为0且不可见时，彻底删除原问卷
            Integer originQuote = surveyMapper.selectCountQuote(originId);
            if(originQuote == 0 && !isVisibility(originId)) {
                surveyMapper.deleteSurveyById(originId);
                List<QuestionVO> questionVOS = questionService.getQuestionVOs(originId);
                for (QuestionVO qu:questionVOS
                ) {
                    questionService.deleteQuestion(qu.getId());
                    questionService.deleteQsAndAn(qu.getType(), qu.getQsItemId());
                }
            }
        }
        // 获取问卷引用数
        Integer quote = surveyMapper.selectCountQuote(id);
        // 若引用数大于0，删除操作只隐藏问卷
        if(quote > 0) {
            Survey survey = new Survey();
            survey.setId(id);
            survey.setVisibility(0);
            surveyMapper.updateSurveyById(survey);
            return;
        }
        // 彻底删除问卷表中的记录
        surveyMapper.deleteSurveyById(id);
        // 彻底删除问卷对应的题目
        List<QuestionVO> questionVOS = questionService.getQuestionVOs(id);
        for (QuestionVO qu:questionVOS
        ) {
            questionService.deleteQuestion(qu.getId());
            questionService.deleteQsAndAn(qu.getType(), qu.getQsItemId());
        }
    }

    /**
     * 给问卷的浏览数增加1
     * @param surveyId
     */
    @Override
    public void addVisits(String surveyId) {
        surveyMapper.updateVisitsIncreased(surveyId);
    }

    @Override
    public String findOriginId(String surveyId) {
        return surveyMapper.selectReferenceToById(surveyId);
    }

    /**
     * 给问卷的引用数增加1
     * @param surveyId
     */
    @Override
    public void addQuote(String surveyId) {
        surveyMapper.updateQuoteIncreased(surveyId);
    }

    /**
     * 给问卷的引用数删减1
     * @param surveyId
     */
    @Override
    public void reduceQuote(String surveyId) {
        surveyMapper.updateQuoteDecreased(surveyId);
    }

    /**
     * 移除问卷的引用模板ID
     * @param surveyId
     */
    @Override
    public void removeReferenceTo(String surveyId) {
        surveyMapper.updateReferenceToSetNull(surveyId);
    }

    /**
     * 是否引用自模板问卷
     * @param surveyId
     * @return
     */
    @Override
    public boolean isReference(String surveyId) {
        String originId = surveyMapper.selectReferenceToById(surveyId);
        if(originId != null) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 是否被其它问卷引用
     * @param surveyId
     * @return
     */
    @Override
    public boolean isQuote(String surveyId) {
        Integer quote = surveyMapper.selectCountQuote(surveyId);
        if(quote > 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 是否可见性
     * @param surveyId
     * @return
     */
    @Override
    public boolean isVisibility(String surveyId) {
        Integer visibility = surveyMapper.selectVisibility(surveyId);
        if(visibility == 0) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 管理员：获取问卷管理列表
     * @param page
     * @param size
     * @return
     */
    @Override
    public List<Survey> findAllSurvey(Integer page, Integer size) {
        Integer start = (page - 1) * size;
        return surveyMapper.findAllSurvey(start, size);
    }

    /**
     * 管理员：获取问卷总数
     * @return
     */
    @Override
    public Integer getSurveyCount() {
        return surveyMapper.getSurveyCount();
    }

    /**
     * 管理员：修改问卷状态（可见性）
     * @param visibility
     * @param id
     */
    @Override
    public void modifySurveyVisibility(Integer visibility, String id) {
        surveyMapper.modifyVisibility(visibility, id);
    }

    /**
     * 管理员：获取今日新增问卷数量
     * @return
     */
    @Override
    public Integer getCurDaySurvey() {
        return surveyMapper.getCurDaySurveyCount();
    }
}
