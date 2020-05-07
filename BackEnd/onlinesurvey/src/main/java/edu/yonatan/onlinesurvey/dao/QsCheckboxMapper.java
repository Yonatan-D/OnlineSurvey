package edu.yonatan.onlinesurvey.dao;

import edu.yonatan.onlinesurvey.entity.QsCheckbox;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface QsCheckboxMapper {
    @Select("select title from t_qs_checkbox where id=#{id}")
    String selectTitleById(String id);

    @Update("update t_qs_checkbox set title=#{title} where id=#{id}")
    int updateTitleById(QsCheckbox qsCheckbox);

    @Insert("<script>" +
            "insert into t_qs_checkbox" +
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
    int insertQsCheckbox(QsCheckbox qsCheckbox);

    @Delete("delete from t_qs_checkbox where id=#{id}")
    int deleteQsCheckboxById(String id);
}
