package edu.yonatan.onlinesurvey.dao;

import edu.yonatan.onlinesurvey.entity.QsRate;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface QsRateMapper {
    @Select("select title from t_qs_rate where id=#{id}")
    String selectTitleById(String id);

    @Update("update t_qs_rate set title=#{title} where id=#{id}")
    int updateTitleById(QsRate qsRate);

    @Insert("<script>" +
            "insert into t_qs_rate" +
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
    int insertQsRate(QsRate qsRate);

    @Delete("delete from t_qs_rate where id=#{id}")
    int deleteQsRateById(String id);
}
