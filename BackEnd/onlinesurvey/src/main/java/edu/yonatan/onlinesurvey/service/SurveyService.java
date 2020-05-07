package edu.yonatan.onlinesurvey.service;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.onlinesurvey.entity.Survey;
import edu.yonatan.onlinesurvey.vo.RecycleAnswerVO;
import edu.yonatan.onlinesurvey.vo.SurveyListVO;
import edu.yonatan.onlinesurvey.vo.SurveyVO;

import java.util.List;

public interface SurveyService {
    // 获取整份问卷
    SurveyVO getSurveyVOById(String id);
    // 获取用户的问卷列表
    List<SurveyListVO> getSurveysByCreator(String creator);
    // 获取问卷信息
    Survey getSurvey(String surveyId);
    // 提交填写问卷
    void saveSurveyOfRecycle(RecycleAnswerVO recycleAnswerVO);
    // 修改问卷信息
    void modifySurveyInfoOfEdit(Survey survey);
    // 新建空白问卷
    String newBlankSurvey(String creator);
    // 创建模板问卷-A-引用问卷
    String quoteTemplateSurvey(String surveyId, String creator);
    // 创建模板问卷-B-创建新问卷
    String newTemplateSurvey(String surveyId, String creator);
    // 删除问卷
    void deleteSurveyById(String id);
    // 给问卷的浏览数增加1
    void addVisits(String surveyId);
    // 获取引用模板的ID
    String findOriginId(String surveyId);
    // 给问卷的引用数增加1
    void addQuote(String surveyId);
    // 给问卷的引用数删减1
    void reduceQuote(String surveyId);
    // 移除问卷的引用模板ID
    void removeReferenceTo(String surveyId);
    // 是否引用自模板问卷
    boolean isQuote(String surveyId);
    // 是否被其它问卷引用
    boolean isReference(String surveyId);
    // 是否可见性
    boolean isVisibility(String surveyId);
    // 管理员：获取问卷管理列表
    List<Survey> findAllSurvey(Integer page, Integer size);
    // 管理员：获取问卷总数
    Integer getSurveyCount();
    // 管理员：修改问卷状态（可见性）
    void modifySurveyVisibility(Integer visibility, String id);
    // 管理员：获取今日新增问卷数量
    Integer getCurDaySurvey();
}
