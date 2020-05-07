package edu.yonatan.onlinesurvey.dao;

import edu.yonatan.onlinesurvey.entity.Survey;
import edu.yonatan.onlinesurvey.vo.SearchServeyVO;
import edu.yonatan.onlinesurvey.vo.SurveyListVO;
import edu.yonatan.onlinesurvey.vo.SurveyVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SurveyMapper {
    @Select("select * from t_survey where id=#{id} and visibility=1")
    SurveyVO selectSurveyToVOById(String id);

    @Select("select * from t_survey where id=#{id} and visibility=1")
    Survey selectSurvey(String id);

    @Select("select id, title, introduction, number, total_time from t_survey where id=#{id} and visibility=1")
    Survey selectSurveyOfTemplate(String id);

    @Select("select quote from t_survey where id=#{id} and visibility=1")
    Integer selectCountQuote(String id);

    @Select("select reference_to from t_survey where id=#{id} and visibility=1")
    String selectReferenceToById(String id);

    @Select("select * from t_survey where creator=#{creator} and visibility=1 order by created_date desc")
    List<SurveyListVO> selectSurveysByCreator(String creator);

    @Select("select visits from t_survey where id=#{id} and visibility=1")
    Integer selectCountOfVisits(String id);

    @Select("select visibility from t_survey where id=#{id} and visibility=1")
    Integer selectVisibility(String id);

    @Select("select ifnull(count(*), 0) " +
            "from t_survey " +
            "where visibility=1 " +
            "and title like concat ('%', #{searchText},'%') " +
            "or introduction like concat ('%', #{searchText},'%') ")
    Integer selectSurveyCountByTitleAndIntro(String searchText);

    @Select("<script>" +
            "select s.*, GROUP_CONCAT(t.tag_name) as tags " +
            "from t_survey s left join t_survey_tag t " +
            "on s.id = t.survey_id " +
            "where visibility=1 " +
            "and title like concat ('%', #{searchText},'%') " +
            "or introduction like concat ('%', #{searchText},'%') " +
            "group by s.id " +
            "order by s.update_date desc " +
            "<if test=\"start != null and limit != null\">\n" +
            "  limit #{start}, #{limit}\n" +
            "</if>" +
            "</script>")
    List<SearchServeyVO> searchTextByDate(String searchText, Integer start, Integer limit);

    @Select("<script>" +
            "select s.*, GROUP_CONCAT(t.tag_name) as tags " +
            "from t_survey s left join t_survey_tag t " +
            "on s.id = t.survey_id " +
            "where visibility=1 " +
            "and title like concat ('%', #{searchText},'%') " +
            "or introduction like concat ('%', #{searchText},'%') " +
            "group by s.id " +
            "order by s.quote desc " +
            "<if test=\"start != null and limit != null\">\n" +
            "  limit #{start}, #{limit}\n" +
            "</if>" +
            "</script>")
    List<SearchServeyVO> searchTextByQuote(String searchText, Integer start, Integer limit);

    @Select("<script>" +
            "select s.*, GROUP_CONCAT(t.tag_name) as tags " +
            "from t_survey s left join t_survey_tag t " +
            "on s.id = t.survey_id " +
            "where visibility=1 " +
            "and title like concat ('%', #{searchText},'%') " +
            "or introduction like concat ('%', #{searchText},'%') " +
            "group by s.id " +
            "order by s.visits desc " +
            "<if test=\"start != null and limit != null\">\n" +
            "  limit #{start}, #{limit}\n" +
            "</if>" +
            "</script>")
    List<SearchServeyVO> searchTextByVisits(String searchText, Integer start, Integer limit);

    @Select("<script>" +
            "select id, title, introduction, number, total_time, created_date, update_date, creator, status, visibility " +
            "from t_survey " +
            "order by update_date desc " +
            "<if test=\"start != null and limit != null\">\n" +
            "  limit #{start}, #{limit}\n" +
            "</if>" +
            "</script>")
    List<Survey> findAllSurvey(Integer start, Integer limit);

    @Select("select count(*) from t_survey")
    Integer getSurveyCount();

    @Select("select count(*) from t_survey where date(created_date) = curdate()")
    Integer getCurDaySurveyCount();

    @Update("update t_survey set visits=visits+1 where id=#{id}")
    int updateVisitsIncreased(String id);

    @Update("update t_survey set quote=quote+1 where id=#{id}")
    int updateQuoteIncreased(String id);

    @Update("update t_survey set quote=quote-1 where id=#{id}")
    int updateQuoteDecreased(String id);

    @Update("update t_survey set reference_to = null where id=#{surveyId}")
    int updateReferenceToSetNull(String surveyId);

    @Update({"<script>" +
            "update t_survey\n" +
            "<set>\n" +
            "<if test=\"title != null\">title = #{title},</if>\n" +
            "<if test=\"introduction != null\">introduction = #{introduction},</if>\n" +
            "<if test=\"number != null\">number = #{number},</if>\n" +
            "<if test=\"totalTime != null\">total_time = #{totalTime},</if>\n" +
            "<if test=\"enHandle != null\">en_handle = #{enHandle},</if>\n" +
            "<if test=\"enAnDate != null\">en_an_date = #{enAnDate},</if>\n" +
            "<if test=\"updateDate != null\">update_date = #{updateDate},</if>\n" +
            "<if test=\"creator != null\">creator = #{creator},</if>\n" +
            "<if test=\"status != null\">status = #{status},</if>\n" +
            "<if test=\"visibility != null\">visibility = #{visibility},</if>\n" +
            "<if test=\"visits != null\">visits = #{visits},</if>\n" +
            "<if test=\"quote != null\">quote = #{quote},</if>\n" +
            "<if test=\"referenceTo != null\">reference_to = #{referenceTo}</if>\n" +
            "</set>" +
            "where id = #{id}" +
            "</script>"})
    int updateSurveyById(Survey survey);

    @Insert("<script>" +
            "insert into t_survey" +
            "<trim prefix=\"(\" suffix=\")\" suffixOverrides=\",\">" +
            "  <if test=\"id != null\">" +
            "    id," +
            "  </if>" +
            "  <if test=\"title != null\">" +
            "    title," +
            "  </if>" +
            "  <if test=\"introduction != null\">" +
            "    introduction," +
            "  </if>" +
            "  <if test=\"number != null\">" +
            "    number," +
            "  </if>" +
            "  <if test=\"totalTime != null\">" +
            "    total_time," +
            "  </if>" +
            "  <if test=\"createdDate != null\">" +
            "    created_date," +
            "  </if>" +
            "  <if test=\"updateDate != null\">" +
            "    update_date," +
            "  </if>" +
            "  <if test=\"enHandle != null\">" +
            "    en_handle," +
            "  </if>" +
            "  <if test=\"enAnDate != null\">" +
            "    en_an_date," +
            "  </if>" +
            "  <if test=\"creator != null\">" +
            "    creator," +
            "  </if>" +
            "  <if test=\"status != null\">" +
            "    status," +
            "  </if>" +
            "  <if test=\"visibility != null\">" +
            "    visibility," +
            "  </if>" +
            "  <if test=\"visits != null\">" +
            "    visits," +
            "  </if>" +
            "  <if test=\"quote != null\">" +
            "    quote," +
            "  </if>" +
            "  <if test=\"referenceTo != null\">" +
            "    reference_to," +
            "  </if>" +
            "</trim>" +
            "<trim prefix=\"values (\" suffix=\")\" suffixOverrides=\",\">" +
            "  <if test=\"id != null\">" +
            "    #{id}," +
            "  </if>" +
            "  <if test=\"title != null\">" +
            "    #{title}," +
            "  </if>" +
            "  <if test=\"introduction != null\">" +
            "    #{introduction}," +
            "  </if>" +
            "  <if test=\"number != null\">" +
            "    #{number}," +
            "  </if>" +
            "  <if test=\"totalTime != null\">" +
            "    #{totalTime}," +
            "  </if>" +
            "  <if test=\"createdDate != null\">" +
            "    #{createdDate}," +
            "  </if>" +
            "  <if test=\"updateDate != null\">" +
            "    #{updateDate}," +
            "  </if>" +
            "  <if test=\"enHandle != null\">" +
            "    #{enHandle}," +
            "  </if>" +
            "  <if test=\"enAnDate != null\">" +
            "    #{enAnDate}," +
            "  </if>" +
            "  <if test=\"creator != null\">" +
            "    #{creator}," +
            "  </if>" +
            "  <if test=\"status != null\">" +
            "    #{status}," +
            "  </if>" +
            "  <if test=\"visibility != null\">" +
            "    #{visibility}," +
            "  </if>" +
            "  <if test=\"visits != null\">" +
            "    #{visits}," +
            "  </if>" +
            "  <if test=\"quote != null\">" +
            "    #{quote}," +
            "  </if>" +
            "  <if test=\"referenceTo != null\">" +
            "    #{referenceTo}," +
            "  </if>" +
            "</trim>" +
            "</script>")
    int insertSurvey(Survey survey);

    @Delete("delete from t_survey where id=#{id}")
    int deleteSurveyById(String id);

    @Update("update t_survey set visibility = #{visibility} where id = #{id}")
    int modifyVisibility(Integer visibility, String id);
}
