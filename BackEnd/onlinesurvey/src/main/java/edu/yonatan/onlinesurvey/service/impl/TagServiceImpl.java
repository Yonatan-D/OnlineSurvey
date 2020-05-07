package edu.yonatan.onlinesurvey.service.impl;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.onlinesurvey.dao.SurveyTagMapper;
import edu.yonatan.onlinesurvey.entity.SurveyTag;
import edu.yonatan.onlinesurvey.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TagServiceImpl implements TagService {
    @Autowired
    private SurveyTagMapper surveyTagMapper;

    /**
     * 获取全部标签名称
     * @return
     */
    @Override
    public List<String> getAllTags() {
        return surveyTagMapper.selectAllTags();
    }

    /**
     * 查询该标签下的问卷
     * @param tag
     * @return
     */
    @Override
    public List<JSONObject> findSurveyListByTag(String tag) {
        return surveyTagMapper.selectSurveyListByTag(tag);
    }

    /**
     * 获取问卷的标签
     * @param surveyId
     * @return
     */
    @Override
    public List<SurveyTag> getSurveyTags(String surveyId) {
        return surveyTagMapper.selectTagsBySurveyId(surveyId);
    }

    /**
     * 添加问卷的标签
     * @param surveyId
     * @param tagName
     */
    @Override
    public void addSurveyTags(String surveyId, String tagName) {
        surveyTagMapper.addTags(surveyId, tagName);
    }

    /**
     * 删除问卷的标签
     * @param id
     */
    @Override
    public void deleteSurveyTags(Integer id) {
        surveyTagMapper.deleteTags(id);
    }
}
