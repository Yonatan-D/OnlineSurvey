package edu.yonatan.onlinesurvey.dao;

import edu.yonatan.onlinesurvey.entity.Answer;
import edu.yonatan.onlinesurvey.vo.TextVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnswerMapper {
    @Insert("insert into t_answer value (#{id}, #{recycleId}, #{questionId}, #{type}, #{content})")
    int saveAnswer(Answer answer);

    @Select("select count(*) from t_answer where question_id=#{questionId} and content=#{optionId}")
    int calcChoiceNumber(String questionId, String optionId);

    @Select("select count(*) from " +
            "(select count(*) as number from t_answer where question_id = #{questionId} " +
            "group by recycle_id) t")
    int calcValidAnswerNumber(String questionId);

    // 统计评分题
    @Select("select count(*) from t_answer where question_id=#{questionId} and content=#{rate}")
    int calcRateNumber(String questionId, Integer rate);

    // 文本题分页查询
    @Select("<script>" +
            "select a.content, a.recycle_id, r.submit_date " +
            "from t_answer a " +
            "join t_survey_recycle r on " +
            "a.recycle_id = r.id " +
            "where question_id=#{questionId} " +
            "and content!=''" +
            "order by r.submit_date" +
            "<if test=\"start != null and limit != null\">\n" +
            "  limit #{start}, #{limit}\n" +
            "</if>" +
            "</script>")
    List<TextVO> selectTextContent(String questionId, Integer start, Integer limit);

    @Select("select count(*) from t_answer where question_id=#{questionId} and content!=''")
    int calcTextValidSum(String questionId);

    @Select("select content from t_answer where recycle_id=#{recycleId} and question_id=#{questionId}")
    List<String> selectContent(String recycleId, String questionId);

    @Select("select ifnull(count(*), 0) from t_answer a " +
            "left join t_answer b on a.recycle_id=b.recycle_id " +
            "where a.content=#{xId} and b.content=#{yId}")
    Integer calcCrossCount(String xId, String yId);

    @Delete("delete from t_answer where question_id=#{questionId}")
    int deleteAnswersByQid(String questionId);
}
