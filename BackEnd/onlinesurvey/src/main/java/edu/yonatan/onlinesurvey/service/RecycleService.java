package edu.yonatan.onlinesurvey.service;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.onlinesurvey.entity.SurveyRecycle;
import edu.yonatan.onlinesurvey.vo.AnswerPageVO;
import edu.yonatan.onlinesurvey.vo.PanelNumVO;
import edu.yonatan.onlinesurvey.vo.QuestionVO;
import edu.yonatan.onlinesurvey.vo.TextVO;

import java.util.List;

public interface RecycleService {
    // 获取回收答卷的列表
    List<SurveyRecycle> getRecyclesBySurveyId(String surveyId, Integer page, Integer size);
    // 获取回收答卷的总数
    Integer getRecyclesCount(String surveyId);
    // 获取答题详细情况
    List<QuestionVO> getAnswersAndStatiste(String id);
    // 获取文本题的列表
    List<TextVO> getTextAnswerDetail(String questionId, Integer page, Integer size);
    // 获取指定答卷的详细信息
    SurveyRecycle getRecycleDetail(String recycleId);
    // 获取指定答卷的题目与回答
    List<AnswerPageVO> getAnswerPageList(String surveyId, String recycleId);
    // 获取回收问卷的数字统计
    PanelNumVO getPanelNumbers(String surveyId);
    // 删除答卷
    void deleteRecycleById(String id);
    // 删除问卷对应的所有答卷
    void deleteRecyclesBySurveyId(String surveyId);
    // 获取回收答卷的来源渠道
    List<JSONObject> getDataSource(String surveyId);
    // 获取回收答卷的地理位置
    List<JSONObject> getMapData(String surveyId);
    // 交叉分析
    JSONObject getCrossAnalysisData(String xValue, String yValue);
}
