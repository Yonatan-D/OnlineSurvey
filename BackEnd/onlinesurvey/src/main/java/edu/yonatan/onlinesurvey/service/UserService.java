package edu.yonatan.onlinesurvey.service;

import edu.yonatan.onlinesurvey.config.UserRole;
import edu.yonatan.onlinesurvey.entity.User;
import edu.yonatan.onlinesurvey.vo.UserManageVO;

import java.util.Date;
import java.util.List;

public interface UserService {
    // 根据用户名查询用户
    User findByUsername(String username);
    // 根据ID查询用户
    User findUserById(String userId);
    // 添加新用户
    void addUser(User user);
    // 记录最近一次登录时间
    void modifyLastLoginDate(Date date, String id);
    // 获取用户管理列表
    List<UserManageVO> findAllUser(UserRole role, Integer page, Integer size);
    // 获取用户总数
    Integer getUserCountByRole(UserRole role);
    // 修改用户帐号状态
    void modifyUserStatus(Integer status, String id);
    // 删除用户
    void deleteUser(String id);
    // 获取今日新增用户数量
    Integer getCurDayUser();
}
