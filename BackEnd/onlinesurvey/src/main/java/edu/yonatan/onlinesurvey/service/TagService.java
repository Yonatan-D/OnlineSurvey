package edu.yonatan.onlinesurvey.service;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.onlinesurvey.entity.SurveyTag;

import java.util.List;

public interface TagService {
    // 获取全部标签名称
    List<String> getAllTags();
    // 查询该标签下的问卷
    List<JSONObject> findSurveyListByTag(String tag);
    // 获取问卷的标签
    List<SurveyTag> getSurveyTags(String surveyId);
    // 添加问卷的标签
    void addSurveyTags(String surveyId, String tagName);
    // 删除问卷的标签
    void deleteSurveyTags(Integer id);
}
