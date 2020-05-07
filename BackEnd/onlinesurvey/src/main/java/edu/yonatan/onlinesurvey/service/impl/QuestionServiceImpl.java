package edu.yonatan.onlinesurvey.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import edu.yonatan.onlinesurvey.dao.QuestionMapper;
import edu.yonatan.onlinesurvey.entity.*;
import edu.yonatan.onlinesurvey.service.AnHubService;
import edu.yonatan.onlinesurvey.service.QsHubService;
import edu.yonatan.onlinesurvey.service.QuestionService;
import edu.yonatan.onlinesurvey.vo.QuestionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionMapper questionMapper;
    @Autowired
    private QsHubService qsHubService;
    @Autowired
    private AnHubService anHubService;

    /**
     * 获取题目VO类
     * @param question
     * @return
     */
    @Override
    public QuestionVO getQuestionVO(Question question) {
        QuestionVO questionVO = new QuestionVO();

        String qsid = question.getId();
        String type = question.getType();
        String qsItemId = question.getQsItemId();
        Integer orderId = question.getOrderId();
        Integer isRequired = question.getIsRequired();
        String title = "";

        questionVO.setId(qsid);
        questionVO.setType(type);
        questionVO.setQsItemId(qsItemId);
        questionVO.setOrderId(orderId);
        questionVO.setIsRequired(isRequired);

        switch (type) {
            case "radio":
                title = qsHubService.findTitileOfRadio(qsItemId);
                List<AnRadio> anRadios = anHubService.findOptionsOfRadio(qsItemId);
                questionVO.setTitle(title);
                questionVO.setOptions(anRadios);
                break;
            case "checkbox":
                title = qsHubService.findTitileOfCheckbox(qsItemId);
                List<AnCheckbox> anCheckboxes = anHubService.findOptionsOfCheckbox(qsItemId);
                questionVO.setTitle(title);
                questionVO.setOptions(anCheckboxes);
                break;
            case "textarea":
                title = qsHubService.findTitileOfTextarea(qsItemId);
                questionVO.setTitle(title);
                break;
            case "rate":
                title = qsHubService.findTitileOfRate(qsItemId);
                questionVO.setTitle(title);
                break;
            default:
                break;
        }
        return questionVO;
    }

    /**
     * 获取题目VO类列表
     * @param surveyId
     * @return
     */
    @Override
    public List<QuestionVO> getQuestionVOs(String surveyId) {
        List<QuestionVO> questionVOs = new LinkedList<QuestionVO>();
        List<Question> questionList = questionMapper.selectQuestionInfo(surveyId);
        for (Question question:questionList
        ) {
            QuestionVO questionVO = this.getQuestionVO(question);
            questionVOs.add(questionVO);
        }
        return questionVOs;
    }

    /**
     * 获取题目的标题和选项
     * @param qsItemId
     * @return
     */
    @Override
    public JSONObject getQsItem(String type, String qsItemId) {
        JSONObject content = new JSONObject();
        content.put("type", type);
        String title = "";
        switch (type) {
            case "radio":
                title = qsHubService.findTitileOfRadio(qsItemId);
                List<AnRadio> anRadios = anHubService.findOptionsOfRadio(qsItemId);
                content.put("title", title);
                content.put("options", anRadios);
                break;
            case "checkbox":
                title = qsHubService.findTitileOfCheckbox(qsItemId);
                List<AnCheckbox> anCheckboxes = anHubService.findOptionsOfCheckbox(qsItemId);
                content.put("title", title);
                content.put("options", anCheckboxes);
                break;
            case "textarea":
                title = qsHubService.findTitileOfTextarea(qsItemId);
                content.put("title", title);
                break;
            case "rate":
                title = qsHubService.findTitileOfRate(qsItemId);
                content.put("title", title);
                break;
            default:
                break;
        }
        return content;
    }

    /**
     * 获取题目记录
     * @param surveyId
     * @return
     */
    @Override
    public List<Question> getQuestions(String surveyId) {
        return questionMapper.selectQuestionInfo(surveyId);
    }

    /**
     * 保存题库的题目和选项
     * @param questionVO
     */
    @Override
    public void saveQuestionOfEdit(QuestionVO questionVO) {
        if(questionVO.getIsRequired() != null) {
            Question question = new Question();
            question.setId(questionVO.getId());
            question.setIsRequired(questionVO.getIsRequired());
            questionMapper.updateQuestion(question);
        }
        String type = questionVO.getType();
        switch (type) {
            case "radio":
                // 保存标题
                if(questionVO.getTitle() != null) {
                    QsRadio qsRadio = new QsRadio();
                    qsRadio.setId(questionVO.getQsItemId());
                    qsRadio.setTitle(questionVO.getTitle());
                    qsHubService.saveTitleOfRadio(qsRadio);
                    //
                }
                // 保存选项
                if(questionVO.getOptions() != null) {
                    List opts = questionVO.getOptions();
                    ObjectMapper mapper = new ObjectMapper(); // 将list转成json再反序列成对象
                    List<AnRadio> anRadios = mapper.convertValue(opts, new TypeReference<List<AnRadio>>() {});
                    for (AnRadio an:anRadios
                         ) {
                        // 删除选项
                        if(an.getVisibility() != null && an.getVisibility() == 0) {
                            anHubService.deleteOptionOfRadio(an.getId());
                        }
                        if(an.getId() == null) {
                            anHubService.addOptionOfRadio(an);
                        }
                        else {
                            anHubService.editOptionOfRadio(an);
                        }
                    }
                }
                break;
            case "checkbox":
                // 保存标题
                if(questionVO.getTitle() != null) {
                    QsCheckbox qsCheckbox = new QsCheckbox();
                    qsCheckbox.setId(questionVO.getQsItemId());
                    qsCheckbox.setTitle(questionVO.getTitle());
                    qsHubService.saveTitleOfCheckbox(qsCheckbox);
                }
                // 保存选项
                if(questionVO.getOptions() != null) {
                    List opts = questionVO.getOptions();
                    ObjectMapper mapper = new ObjectMapper(); // 将list转成json再反序列成对象
                    List<AnCheckbox> anCheckboxes = mapper.convertValue(opts, new TypeReference<List<AnCheckbox>>() {});
                    for (AnCheckbox an:anCheckboxes
                         ) {
                        // 删除选项
                        if(an.getVisibility() != null && an.getVisibility() == 0) {
                            anHubService.deleteOptionOfCheckbox(an.getId());
                        }
                        if(an.getId() == null) {
                            anHubService.addOptionOfCheckbox(an);
                        }
                        else {
                            anHubService.editOptionOfCheckbox(an);
                        }
                    }
                }
                break;
            case "textarea":
                // 保存标题
                if(questionVO.getTitle() != null) {
                    QsTextarea qsTextarea = new QsTextarea();
                    qsTextarea.setId(questionVO.getQsItemId());
                    qsTextarea.setTitle(questionVO.getTitle());
                    qsHubService.saveTitleOfTextarea(qsTextarea);
                }
                break;
            case "rate":
                // 保存标题
                if(questionVO.getTitle() != null) {
                    QsRate qsRate = new QsRate();
                    qsRate.setId(questionVO.getQsItemId());
                    qsRate.setTitle(questionVO.getTitle());
                    qsHubService.saveTitleOfRate(qsRate);
                }
                break;
            default:
                break;
        }
    }

    /**
     * 新建题库的题目和选项
     * @param questionVO
     */
    @Override
    public String saveQuestionOfNew(QuestionVO questionVO) {
        String type = questionVO.getType();
        String title = questionVO.getTitle();
        String qsItemId = UUID.randomUUID().toString().replaceAll("-","");
        switch (type) {
            case "radio":
                // 保存单选题到题库
                QsRadio qsRadio = new QsRadio();
                qsRadio.setId(qsItemId);
                qsRadio.setType(type);
                qsRadio.setTitle(title);
                qsRadio.setVisibility(1);
                qsHubService.saveTitleOfRadio(qsRadio);
                // 保存单选题的选项到题库
                List opts = questionVO.getOptions();
                ObjectMapper mapper = new ObjectMapper(); // 将list转成json再反序列成对象
                List<AnRadio> anRadios = mapper.convertValue(opts, new TypeReference<List<AnRadio>>() {});
                for (AnRadio an:anRadios
                ) {
                    an.setQsItemId(qsItemId);
                    anHubService.addOptionOfRadio(an);
                }
                break;
            case "checkbox":
                // 保存多选题到题库
                QsCheckbox qsCheckbox = new QsCheckbox();
                qsCheckbox.setId(qsItemId);
                qsCheckbox.setType(type);
                qsCheckbox.setTitle(title);
                qsCheckbox.setVisibility(1);
                qsHubService.saveTitleOfCheckbox(qsCheckbox);
                // 保存多选题的选项到题库
                opts = questionVO.getOptions();
                mapper = new ObjectMapper(); // 将list转成json再反序列成对象
                List<AnCheckbox> anCheckboxes = mapper.convertValue(opts, new TypeReference<List<AnCheckbox>>() {});
                for (AnCheckbox an:anCheckboxes
                     ) {
                    an.setQsItemId(qsItemId);
                    anHubService.addOptionOfCheckbox(an);
                }
                break;
            case "textarea":
                // 保存文本题到题库
                QsTextarea qsTextarea = new QsTextarea();
                qsTextarea.setId(qsItemId);
                qsTextarea.setType(type);
                qsTextarea.setTitle(title);
                qsTextarea.setVisibility(1);
                qsHubService.saveTitleOfTextarea(qsTextarea);
                break;
            case "rate":
                // 保存评分题到题库
                QsRate qsRate = new QsRate();
                qsRate.setId(qsItemId);
                qsRate.setType(type);
                qsRate.setTitle(title);
                qsRate.setVisibility(1);
                qsHubService.saveTitleOfRate(qsRate);
                break;
            default:
                break;
        }
        return qsItemId;
    }

    /**
     * 删除题目记录
     * @param questionId
     */
    @Override
    public void deleteQuestion(String questionId) {
        questionMapper.deleteQuestion(questionId);
    }

    /**
     * 删除题库的题目和选项
     * @param type
     * @param qsItemId
     */
    @Override
    public void deleteQsAndAn(String type, String qsItemId) {
        switch (type) {
            case "radio":
                qsHubService.deleteRadio(qsItemId);
                anHubService.deleteOptionOfRadioByGroup(qsItemId);
                break;
            case "checkbox":
                qsHubService.deleteCheckbox(qsItemId);
                anHubService.deleteOptionOfCheckboxByGroup(qsItemId);
                break;
            case "textarea":
                qsHubService.deleteTextarea(qsItemId);
                break;
            case "rate":
                qsHubService.deleteRate(qsItemId);
                break;
            default:
                break;
        }
    }

    /**
     * 新增题目记录
     * @param question
     */
    @Override
    public void addQuestion(Question question) {
        questionMapper.insertQuestion(question);
    }

    /**
     * 修改题目记录
     * @param question
     */
    @Override
    public void modifyQuestion(Question question) {
        questionMapper.updateQuestion(question);
    }

    /**
     * 交换题目位置
     * @param fromQuestion
     * @param toQuestion
     */
    @Override
    public void swapQuestionOrderId(Question fromQuestion, Question toQuestion) {
        Integer tempOrderId = fromQuestion.getOrderId();
        fromQuestion.setOrderId(toQuestion.getOrderId());
        toQuestion.setOrderId(tempOrderId);
        questionMapper.updateQuestion(fromQuestion);
        questionMapper.updateQuestion(toQuestion);
    }
}
