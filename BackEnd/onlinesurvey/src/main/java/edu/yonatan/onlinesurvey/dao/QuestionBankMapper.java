package edu.yonatan.onlinesurvey.dao;

import edu.yonatan.onlinesurvey.entity.QuestionBank;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionBankMapper {
    @Insert("insert into t_question_bank (id, belong_id, type, qs_item_id, folder) " +
            "value (#{id}, #{belongId}, #{type}, #{qsItemId}, #{folder})")
    int insertQuestionBank(QuestionBank questionBank);

    @Select("select GROUP_CONCAT(qs_item_id order by created_date desc) as qsItemIds, folder " +
            "from t_question_bank where belong_id=#{belongId} group by folder")
    List<QuestionBank> selectQuestionBankGroup(String belongId);

    @Select("select type from t_question_bank where qs_item_id=#{qsItemId}")
    String findTypeByQsItemId(String qsItemId);

    @Delete("delete from t_question_bank where qs_item_id=#{qsItemId}")
    int deleteQuestionBank(String qsItemId);
}
