package edu.yonatan.onlinesurvey.dao;

import edu.yonatan.onlinesurvey.entity.Question;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionMapper {
    @Select("select * from t_question where survey_id=#{surveyId} order by order_id")
    List<Question> selectQuestionInfo(String surveyId);

    @Select("select * from t_question where survey_id=#{surveyId}")
    List<String> selectQuestionIdBySid(String surveyId);

    @Insert("<script>" +
            "insert into t_question\n" +
            "<trim prefix=\"(\" suffix=\")\" suffixOverrides=\",\">\n" +
            "  <if test=\"id != null\">\n" +
            "    id,\n" +
            "  </if>\n" +
            "  <if test=\"type != null\">\n" +
            "    type,\n" +
            "  </if>\n" +
            "  <if test=\"surveyId != null\">\n" +
            "    survey_id,\n" +
            "  </if>\n" +
            "  <if test=\"qsItemId != null\">\n" +
            "    qs_item_id,\n" +
            "  </if>\n" +
            "  <if test=\"isRequired != null\">\n" +
            "    is_required,\n" +
            "  </if>\n" +
            "  <if test=\"isNote != null\">\n" +
            "    is_note,\n" +
            "  </if>\n" +
            "  <if test=\"note != null\">\n" +
            "    note,\n" +
            "  </if>\n" +
            "  <if test=\"orderId != null\">\n" +
            "    order_id,\n" +
            "  </if>\n" +
            "  <if test=\"createdDate != null\">\n" +
            "    created_date,\n" +
            "  </if>\n" +
            "  <if test=\"tag != null\">\n" +
            "    tag,\n" +
            "  </if>\n" +
            "</trim>\n" +
            "<trim prefix=\"values (\" suffix=\")\" suffixOverrides=\",\">\n" +
            "  <if test=\"id != null\">\n" +
            "    #{id},\n" +
            "  </if>\n" +
            "  <if test=\"type != null\">\n" +
            "    #{type},\n" +
            "  </if>\n" +
            "  <if test=\"surveyId != null\">\n" +
            "    #{surveyId},\n" +
            "  </if>\n" +
            "  <if test=\"qsItemId != null\">\n" +
            "    #{qsItemId},\n" +
            "  </if>\n" +
            "  <if test=\"isRequired != null\">\n" +
            "    #{isRequired},\n" +
            "  </if>\n" +
            "  <if test=\"isNote != null\">\n" +
            "    #{isNote},\n" +
            "  </if>\n" +
            "  <if test=\"note != null\">\n" +
            "    #{note},\n" +
            "  </if>\n" +
            "  <if test=\"orderId != null\">\n" +
            "    #{orderId},\n" +
            "  </if>\n" +
            "  <if test=\"createdDate != null\">\n" +
            "    #{createdDate},\n" +
            "  </if>\n" +
            "  <if test=\"tag != null\">\n" +
            "    #{tag},\n" +
            "  </if>\n" +
            "</trim>" +
            "</script>")
    int insertQuestion(Question question);

    @Delete("delete from t_question where id=#{id}")
    int deleteQuestion(String id);

    @Update({"<script>" +
            "update t_question\n" +
            "<set>\n" +
            "<if test=\"type != null\">type = #{type}, </if>\n" +
            "<if test=\"surveyId != null\">survey_id = #{surveyId}, </if>\n" +
            "<if test=\"qsItemId != null\">qs_item_id = #{qsItemId}, </if>\n" +
            "<if test=\"isRequired != null\">is_required = #{isRequired}, </if>\n" +
            "<if test=\"isNote != null\">is_note = #{isNote}, </if>\n" +
            "<if test=\"note != null\">note = #{note}, </if>\n" +
            "<if test=\"orderId != null\">order_id = #{orderId}, </if>\n" +
            "<if test=\"createdDate != null\">created_date = #{createdDate}, </if>\n" +
            "<if test=\"tag != null\">tag = #{tag} </if>\n" +
            "</set>" +
            "where id = #{id}" +
            "</script>"})
    int updateQuestion(Question question);
}
