package edu.yonatan.onlinesurvey.dao;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.onlinesurvey.entity.SurveyTag;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SurveyTagMapper {
    @Select("select tag_name from t_survey_tag " +
            "group by tag_name " +
            "order by count(tag_name) desc;")
    List<String> selectAllTags();

    @Select("select id, tag_name from t_survey_tag " +
            "where survey_id = #{surveyId}" +
            "order by created_date")
    List<SurveyTag> selectTagsBySurveyId(String surveyId);

    @Select("<script>" +
            "select s.id, s.title " +
            "from t_survey s " +
            "join t_survey_tag t " +
            "on s.id=t.survey_id " +
            "where tag_name = #{tag} " +
            "group by s.id" +
            "</script>")
    List<JSONObject> selectSurveyListByTag(String tag);

    @Insert("insert into t_survey_tag (survey_id, tag_name) value (#{surveyId}, #{tagName})")
    int addTags(String surveyId, String tagName);

    @Delete("delete from t_survey_tag where id=#{id}")
    int deleteTags(Integer id);
}
