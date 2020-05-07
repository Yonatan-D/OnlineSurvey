package edu.yonatan.onlinesurvey.dao;

import edu.yonatan.onlinesurvey.entity.QsTextarea;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface QsTextareaMapper {
    @Select("select title from t_qs_textarea where id=#{id}")
    String selectTitleById(String id);

    @Update("update t_qs_textarea set title=#{title} where id=#{id}")
    int updateTitleById(QsTextarea qsTextarea);

    @Insert("<script>" +
            "insert into t_qs_textarea" +
            "<trim prefix=\"(\" suffix=\")\" suffixOverrides=\",\">" +
            "  <if test=\"id != null\">" +
            "    id," +
            "  </if>" +
            "  <if test=\"type != null\">" +
            "    type," +
            "  </if>" +
            "  <if test=\"title != null\">" +
            "    title," +
            "  </if>" +
            "  <if test=\"visibility != null\">" +
            "    visibility," +
            "  </if>" +
            "</trim>" +
            "<trim prefix=\"values (\" suffix=\")\" suffixOverrides=\",\">" +
            "  <if test=\"id != null\">" +
            "    #{id}," +
            "  </if>" +
            "  <if test=\"type != null\">" +
            "    #{type}," +
            "  </if>" +
            "  <if test=\"title != null\">" +
            "    #{title}," +
            "  </if>" +
            "  <if test=\"visibility != null\">" +
            "    #{visibility}," +
            "  </if>" +
            "</trim>" +
            "</script>")
    int insertQsTextarea(QsTextarea qsTextarea);

    @Delete("delete from t_qs_textarea where id=#{id}")
    int deleteQsTextareaById(String id);
}
