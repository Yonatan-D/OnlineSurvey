package edu.yonatan.onlinesurvey.service.impl;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.onlinesurvey.dao.AnswerMapper;
import edu.yonatan.onlinesurvey.dao.QuestionMapper;
import edu.yonatan.onlinesurvey.dao.SurveyMapper;
import edu.yonatan.onlinesurvey.dao.SurveyRecycleMapper;
import edu.yonatan.onlinesurvey.entity.*;
import edu.yonatan.onlinesurvey.service.AnHubService;
import edu.yonatan.onlinesurvey.service.QsHubService;
import edu.yonatan.onlinesurvey.service.RecycleService;
import edu.yonatan.onlinesurvey.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@Service
public class RecycleServiceImpl implements RecycleService {
    @Autowired
    private SurveyRecycleMapper surveyRecycleMapper;
    @Autowired
    private SurveyMapper surveyMapper;
    @Autowired
    private QsHubService qsHubService;
    @Autowired
    private AnHubService anHubService;
    @Autowired
    private QuestionMapper questionMapper;
    @Autowired
    private AnswerMapper answerMapper;

    /**
     * 获取回收答卷的列表
     * @param page
     * @return
     */
    @Override
    public List<SurveyRecycle> getRecyclesBySurveyId(String surveyId, Integer page, Integer size) {
        Integer start = (page - 1) * size;
        return surveyRecycleMapper.selectRecyclesBySurveyId(surveyId, start, size);
    }

    /**
     * 获取回收答卷的总数
     * @param surveyId
     * @return
     */
    @Override
    public Integer getRecyclesCount(String surveyId) {
        return surveyRecycleMapper.selectRecyclesCount(surveyId);
    }

    /**
     * 获取答题详细情况
     * @param id
     * @return
     */
    @Override
    public List<QuestionVO> getAnswersAndStatiste(String id) {
        List<QuestionVO> questionVOs= new LinkedList<QuestionVO>();
        List<Question> question = questionMapper.selectQuestionInfo(id);
        for (Question qsitem:question
        ) {
            String qsId = qsitem.getId();
            String type = qsitem.getType();
            String qsItemId = qsitem.getQsItemId();
            Integer orderId = qsitem.getOrderId();
            Integer isRequired = qsitem.getIsRequired();
            String title = "";

            QuestionVO questionVO = new QuestionVO();
            questionVO.setId(qsId);
            questionVO.setType(type);
            questionVO.setQsItemId(qsItemId);
            questionVO.setOrderId(orderId);
            questionVO.setIsRequired(isRequired);
            Integer validNumber = answerMapper.calcValidAnswerNumber(qsId);
            questionVO.setValid(validNumber);

            switch (type) {
                case "radio":
                    title = qsHubService.findTitileOfRadio(qsItemId);
                    List<AnRadio> anRadios = anHubService.findOptionsOfRadio(qsItemId);
                    List<ChoiceVO> choicesRd = new LinkedList<>();
                    for (AnRadio an:anRadios
                         ) {
                        ChoiceVO choice = new ChoiceVO();
                        choice.setValue(an.getValue());
                        choice.setNumber(answerMapper.calcChoiceNumber(qsId, an.getId()));
                        choicesRd.add(choice);
                    }
                    questionVO.setTitle(title);
                    questionVO.setOptions(choicesRd);
                    break;
                case "checkbox":
                    title = qsHubService.findTitileOfCheckbox(qsItemId);
                    List<AnCheckbox> anCheckboxes = anHubService.findOptionsOfCheckbox(qsItemId);
                    List<ChoiceVO> choicesCk = new LinkedList<>();
                    for (AnCheckbox an:anCheckboxes
                         ) {
                        ChoiceVO choice = new ChoiceVO();
                        choice.setValue(an.getValue());
                        choice.setNumber(answerMapper.calcChoiceNumber(qsId, an.getId()));
                        choicesCk.add(choice);
                    }
                    questionVO.setTitle(title);
                    questionVO.setOptions(choicesCk);
                    break;
                case "textarea":
                    title = qsHubService.findTitileOfTextarea(qsItemId);
                    questionVO.setTitle(title);
                    break;
                case "rate":
                    title = qsHubService.findTitileOfRate(qsItemId);
                    List<ChoiceVO> choicesRt = new LinkedList<>();
                    for (int rate = 1; rate <= 5; rate++) {
                        Integer number = answerMapper.calcRateNumber(qsId, rate);
                        ChoiceVO choice = new ChoiceVO();
                        choice.setValue(rate+"");
                        choice.setNumber(number);
                        choicesRt.add(choice);
                    }
                    questionVO.setTitle(title);
                    questionVO.setOptions(choicesRt);
                    break;
                default:
                    break;
            }
            questionVOs.add(questionVO);
        }
        return questionVOs;
    }

    /**
     * 获取文本题的列表
     * @param questionId
     * @param page
     * @param size
     * @return
     */
    @Override
    public List<TextVO> getTextAnswerDetail(String questionId, Integer page, Integer size) {
        Integer start = (page - 1) * size;
        List<TextVO> textVOList = answerMapper.selectTextContent(questionId, start, size);
        return textVOList;
    }

    /**
     * 获取指定答卷的详细信息
     * @param recycleId
     * @return
     */
    @Override
    public SurveyRecycle getRecycleDetail(String recycleId) {
        return surveyRecycleMapper.selectRecycleById(recycleId);
    }

    /**
     * 获取指定答卷的题目与回答
     * @param surveyId
     * @param recycleId
     * @return
     */
    @Override
    public List<AnswerPageVO> getAnswerPageList(String surveyId, String recycleId) {
        List<AnswerPageVO> answerPageVOList = new LinkedList<>();
        List<Question> questions = questionMapper.selectQuestionInfo(surveyId);
        for (Question qu:questions
             ) {
            String title = "";
            String content = "";
            Integer must = qu.getIsRequired();
            AnswerPageVO answerPageVO = new AnswerPageVO();
            answerPageVO.setMust(must);
            String type = qu.getType();
            switch (type) {
                case "radio":
                    title = qsHubService.findTitileOfRadio(qu.getQsItemId());
                    answerPageVO.setTitle(title);
                    if(!answerMapper.selectContent(recycleId, qu.getId()).isEmpty()) {
                        String anRdId = answerMapper.selectContent(recycleId, qu.getId()).get(0);
                        content = anHubService.findOptionOfRadio(anRdId);
                        answerPageVO.setContent(content);
                    }
                    answerPageVOList.add(answerPageVO);
                    break;
                case "checkbox":
                    title = qsHubService.findTitileOfCheckbox(qu.getQsItemId());
                    answerPageVO.setTitle(title);
                    if(!answerMapper.selectContent(recycleId, qu.getId()).isEmpty()) {
                        List<String> anCkIds = answerMapper.selectContent(recycleId, qu.getId());
                        for (String anCkId:anCkIds
                             ) {
                            content += anHubService.findOptionOfCheckbox(anCkId)+" / ";
                        }
                        answerPageVO.setContent(content);
                    }
                    answerPageVOList.add(answerPageVO);
                    break;
                case "textarea":
                    title = qsHubService.findTitileOfTextarea(qu.getQsItemId());
                    answerPageVO.setTitle(title);
                    if(!answerMapper.selectContent(recycleId, qu.getId()).isEmpty()) {
                        content = answerMapper.selectContent(recycleId, qu.getId()).get(0);
                        answerPageVO.setContent(content);
                    }
                    answerPageVOList.add(answerPageVO);
                    break;
                case "rate":
                    title = qsHubService.findTitileOfRate(qu.getQsItemId());
                    answerPageVO.setTitle(title);
                    if(!answerMapper.selectContent(recycleId, qu.getId()).isEmpty()) {
                        content = answerMapper.selectContent(recycleId, qu.getId()).get(0);
                        answerPageVO.setContent(content);
                    }
                    answerPageVOList.add(answerPageVO);
                    break;
                default:
                    break;
            }
        }
        return answerPageVOList;
    }

    /**
     * 获取回收问卷的数字统计
     * @param surveyId
     * @return
     */
    @Override
    public PanelNumVO getPanelNumbers(String surveyId) {
        PanelNumVO panelNum = new PanelNumVO();
        Integer recycles = surveyRecycleMapper.selectRecyclesCount(surveyId);
        Integer visits = surveyMapper.selectCountOfVisits(surveyId);
        Integer recycleRate = 0;
        if(recycles!=0 && visits!=0) {
            recycleRate = Math.round((float)recycles/(float)visits*100);
        }
        Integer totalTimeAvg = surveyRecycleMapper.selectAvgTotalTime(surveyId);
        panelNum.setRecycles(recycles);
        panelNum.setVisits(visits);
        panelNum.setRecycleRate(recycleRate);
        panelNum.setTotalTimeAvg(totalTimeAvg);
        return panelNum;
    }

    /**
     * 删除答卷
     * @param id
     */
    @Override
    public void deleteRecycleById(String id) {
        surveyRecycleMapper.deleteRecycleById(id);
    }

    /**
     * 删除问卷对应的所有答卷
     * @param surveyId
     */
    @Override
    public void deleteRecyclesBySurveyId(String surveyId) {
        surveyRecycleMapper.deleteRecyclesBySurveyId(surveyId);
        //删除对应的答案
        List<String> questIds = questionMapper.selectQuestionIdBySid(surveyId);
        for (String questId:questIds
             ) {
            answerMapper.deleteAnswersByQid(questId);
        }
    }

    /**
     * 获取回收答卷的来源渠道
     * @param surveyId
     * @return
     */
    @Override
    public List<JSONObject> getDataSource(String surveyId) {
        return surveyRecycleMapper.getDataSource(surveyId);
    }

    /**
     * 获取回收答卷的地理位置
     * @param surveyId
     * @return
     */
    @Override
    public List<JSONObject> getMapData(String surveyId) {
        return surveyRecycleMapper.getMapData(surveyId);
    }

    /**
     * 交叉分析
     * @param xValue
     * @param yValue
     * @return
     */
    @Override
    public JSONObject getCrossAnalysisData(String xValue, String yValue) {
        JSONObject crossAnalyData = new JSONObject();
        List<JSONObject> tableData = new ArrayList();
        List<String> tableHeader = new ArrayList<>();
        // 获取选项
        List<AnRadio> xRadios = anHubService.findOptionsOfRadio(xValue);
        List<AnRadio> yRadios = anHubService.findOptionsOfRadio(yValue);
        // 交叉分析，拼接tableData
        for (AnRadio xAn:xRadios
             ) {
            JSONObject data = new JSONObject();
            data.put("product", xAn.getValue());
            Integer sum = 0;
            for (AnRadio yAn:yRadios
                 ) {
                Integer number = answerMapper.calcCrossCount(xAn.getId(), yAn.getId());
                data.put(yAn.getValue(), number);
                sum += number;
            }
            data.put("小计", sum);
            tableData.add(data);
        }
        // 表头，拼接tableHeader
        for (AnRadio yAn:yRadios
             ) {
            tableHeader.add(yAn.getValue());
        }
        tableHeader.add("小计");
        // 拼接成最终json
        crossAnalyData.put("tableData", tableData);
        crossAnalyData.put("tableHeader", tableHeader);
        return crossAnalyData;
    }

}
