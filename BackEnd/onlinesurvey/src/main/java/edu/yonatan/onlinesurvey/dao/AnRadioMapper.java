package edu.yonatan.onlinesurvey.dao;

import edu.yonatan.onlinesurvey.entity.AnRadio;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnRadioMapper {
    @Select("select * from t_an_radio where qs_item_id=#{qsItemId} order by order_id")
    List<AnRadio> selectOptionsByQsItemId(String qsItemId);

    @Select("select value from t_an_radio where id=#{id}")
    String selectOptionsById(String id);

    @Insert("insert into t_an_radio value (#{id}, #{value}, #{qsItemId}, #{orderId}, #{visibility})")
    int insertOption(AnRadio anRadio);

    @Update({"<script>" +
            "update t_an_radio\n" +
            "<set>\n" +
            "<if test=\"value != null\">value = #{value},</if>\n" +
            "<if test=\"qsItemId != null\">qs_item_id = #{qsItemId},</if>\n" +
            "<if test=\"orderId != null\">order_id = #{orderId},</if>\n" +
            "<if test=\"visibility != null\">visibility = #{visibility}</if>\n" +
            "</set>" +
            "where id = #{id}" +
            "</script>"})
    int updateOptionById(AnRadio anRadio);

    @Delete("delete from t_an_radio where id=#{id}")
    int deleteOptionById(String id);

    @Delete("delete from t_an_radio where qs_item_id=#{qsItemId}")
    int deleteOptionByQsItemId(String qsItemId);
}
