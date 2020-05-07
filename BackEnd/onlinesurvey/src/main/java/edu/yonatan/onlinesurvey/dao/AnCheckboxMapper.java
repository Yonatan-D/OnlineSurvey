package edu.yonatan.onlinesurvey.dao;

import edu.yonatan.onlinesurvey.entity.AnCheckbox;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnCheckboxMapper {
    @Select("select * from t_an_checkbox where qs_item_id=#{qsItemId} order by order_id")
    List<AnCheckbox> selectOptionsByQsItemId(String qsItemId);

    @Select("select value from t_an_checkbox where id=#{id}")
    String selectOptionsById(String id);

    @Insert("insert into t_an_checkbox value (#{id}, #{value}, #{qsItemId}, #{orderId}, #{visibility})")
    int insertOption(AnCheckbox anCheckbox);

    @Update({"<script>" +
            "update t_an_checkbox\n" +
            "<set>\n" +
            "<if test=\"value != null\">value = #{value},</if>\n" +
            "<if test=\"qsItemId != null\">qs_item_id = #{qsItemId},</if>\n" +
            "<if test=\"orderId != null\">order_id = #{orderId},</if>\n" +
            "<if test=\"visibility != null\">visibility = #{visibility}</if>\n" +
            "</set>" +
            "where id = #{id}" +
            "</script>"})
    int updateOptionById(AnCheckbox anCheckbox);

    @Delete("delete from t_an_checkbox where id=#{id}")
    int deleteOptionById(String id);

    @Delete("delete from t_an_checkbox where qs_item_id=#{qsItemId}")
    int deleteOptionByQsItemId(String qsItemId);
}
