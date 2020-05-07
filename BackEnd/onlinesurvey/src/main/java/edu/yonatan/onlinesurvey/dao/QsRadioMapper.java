package edu.yonatan.onlinesurvey.dao;

import edu.yonatan.onlinesurvey.entity.QsRadio;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface QsRadioMapper {
    @Select("select title from t_qs_radio where id=#{id}")
    String selectTitleById(String id);

    @Update("update t_qs_radio set title=#{title} where id=#{id}")
    int updateTitleById(QsRadio qsRadio);

    @Insert("<script>" +
            "insert into t_qs_radio" +
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
    int insertQsRadio(QsRadio qsRadio);

    @Delete("delete from t_qs_radio where id=#{id}")
    int deleteQsRadioById(String id);
}
