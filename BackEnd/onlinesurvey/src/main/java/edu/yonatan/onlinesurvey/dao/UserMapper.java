package edu.yonatan.onlinesurvey.dao;

import edu.yonatan.onlinesurvey.config.UserRole;
import edu.yonatan.onlinesurvey.entity.User;
import edu.yonatan.onlinesurvey.vo.UserManageVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface UserMapper {
    @Select("select * from t_user where username=#{username}")
    User findByUsername(String username);

    @Select("select * from t_user where id=#{id}")
    User findUserById(String id);

    @Select("insert into t_user (id, username, email, password, salt, role) " +
            "value (#{id}, #{username}, #{email}, #{password}, #{salt}, #{role})")
    void addUser(User user);

    @Select("<script>" +
            "select id, username, email, created_date, last_login_date, status " +
            "from t_user where role=#{role} " +
            "order by last_login_date desc " +
            "<if test=\"start != null and limit != null\">\n" +
            "  limit #{start}, #{limit}\n" +
            "</if>" +
            "</script>")
    List<UserManageVO> findAllUser(Integer role, Integer start, Integer limit);

    @Select("select count(*) from t_user where role=#{role}")
    Integer getUserCountByRole(Integer role);

    @Select("select count(*) from t_user where date(created_date) = curdate()")
    Integer getCurDayUserCount();

    @Update("update t_user set last_login_date = #{date} where id = #{id}")
    int modifyLastLoginDate(Date date, String id);

    @Update("update t_user set status = #{status} where id = #{id}")
    int modifyStatus(Integer status, String id);

    @Delete("delete from t_user where id = #{id}")
    int deleteUserById(String id);
}
