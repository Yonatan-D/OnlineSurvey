package edu.yonatan.onlinesurvey.dao;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.onlinesurvey.entity.SurveyRecycle;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SurveyRecycleMapper {
    @Select("<script>" +
            "select * from t_survey_recycle " +
            "where survey_id=#{surveyId} " +
            "order by submit_date" +
            "<if test=\"start != null and limit != null\">\n" +
            "  limit #{start}, #{limit}\n" +
            "</if>" +
            "</script>")
    List<SurveyRecycle> selectRecyclesBySurveyId(String surveyId, Integer start, Integer limit);

    @Select("select ifnull(count(id),0) from t_survey_recycle where survey_id=#{surveyId}")
    Integer selectRecyclesCount(String surveyId);

    @Select("select ifnull(ROUND(AVG(total_time),0),0) from t_survey_recycle where survey_id=#{surveyId}")
    Integer selectAvgTotalTime(String surveyId);

    @Select("select * from t_survey_recycle where id=#{id}")
    SurveyRecycle selectRecycleById(String id);

    @Select("select count(id) as value, data_source as name from t_survey_recycle " +
            "where survey_id=#{surveyId} group by data_source")
    List<JSONObject> getDataSource(String surveyId);

    @Select("select count(id) as value, left(position,2) as name from t_survey_recycle " +
            "where survey_id=#{surveyId} group by position;")
    List<JSONObject> getMapData(String surveyId);

    @Insert("<script>" +
            "insert into t_survey_recycle" +
            "<trim prefix=\"(\" suffix=\")\" suffixOverrides=\",\">" +
            "  <if test=\"id != null\">" +
            "    id," +
            "  </if>" +
            "  <if test=\"surveyId != null\">" +
            "    survey_id," +
            "  </if>" +
            "  <if test=\"totalTime != null\">" +
            "    total_time," +
            "  </if>" +
            "  <if test=\"submitDate != null\">" +
            "    submit_date," +
            "  </if>" +
            "  <if test=\"deviceInfo != null\">" +
            "    device_info," +
            "  </if>" +
            "  <if test=\"dataSource != null\">" +
            "    data_source," +
            "  </if>" +
            "  <if test=\"ip != null\">" +
            "    ip," +
            "  </if>" +
            "  <if test=\"position != null\">" +
            "    position," +
            "  </if>" +
            "</trim>" +
            "<trim prefix=\"values (\" suffix=\")\" suffixOverrides=\",\">" +
            "  <if test=\"id != null\">" +
            "    #{id}," +
            "  </if>" +
            "  <if test=\"surveyId != null\">" +
            "    #{surveyId}," +
            "  </if>" +
            "  <if test=\"totalTime != null\">" +
            "    #{totalTime}," +
            "  </if>" +
            "  <if test=\"submitDate != null\">" +
            "    #{submitDate}," +
            "  </if>" +
            "  <if test=\"deviceInfo != null\">" +
            "    #{deviceInfo}," +
            "  </if>" +
            "  <if test=\"dataSource != null\">" +
            "    #{dataSource}," +
            "  </if>" +
            "  <if test=\"ip != null\">" +
            "    #{ip}," +
            "  </if>" +
            "  <if test=\"position != null\">" +
            "    #{position}," +
            "  </if>" +
            "</trim>" +
            "</script>")
    int saveRecycleSurvey(SurveyRecycle surveyRecycle);

    @Delete("delete from t_survey_recycle where id=#{id}")
    void deleteRecycleById(String id);

    @Delete("delete from t_survey_recycle where survey_id=#{surveyId}")
    void deleteRecyclesBySurveyId(String surveyId);
}
