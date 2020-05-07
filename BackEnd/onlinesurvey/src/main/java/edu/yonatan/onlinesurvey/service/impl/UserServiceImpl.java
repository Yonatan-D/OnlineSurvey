package edu.yonatan.onlinesurvey.service.impl;

import edu.yonatan.onlinesurvey.config.UserRole;
import edu.yonatan.onlinesurvey.dao.UserMapper;
import edu.yonatan.onlinesurvey.entity.User;
import edu.yonatan.onlinesurvey.service.PwdService;
import edu.yonatan.onlinesurvey.service.UserService;
import edu.yonatan.onlinesurvey.vo.UserManageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private PwdService pwdService;

    /**
     * 根据用户名查询用户
     * @param username
     * @return
     */
    @Override
    public User findByUsername(String username) {
        return userMapper.findByUsername(username);
    }

    /**
     * 根据ID查询用户
     * @param userId
     * @return
     */
    @Override
    public User findUserById(String userId) {
        return userMapper.findUserById(userId);
    }

    /**
     * 添加新用户
     * @param user
     */
    @Override
    public void addUser(User user) {
        // 生成随机用户ID
        String id = UUID.randomUUID().toString().replaceAll("-","");
        user.setId(id);
        // 生成随机加密盐值
        String salt = "SURVEY2020" + Math.round(Math.random()*999999);
        user.setSalt(salt);
        // 生成密码的密文
        String pass = user.getPassword();
        String encryptPass = pwdService.encrypt(pass, salt);
        user.setPassword(encryptPass);
        // 普通用户
        user.setRole(UserRole.ROLE_NORMAL.getRoleCode());
        userMapper.addUser(user);
    }

    /**
     * 记录最近一次登录时间
     * @param date
     * @param id
     */
    @Override
    public void modifyLastLoginDate(Date date, String id) {
        userMapper.modifyLastLoginDate(date, id);
    }

    /**
     * 获取用户管理列表
     * @param role
     * @param page
     * @param size
     * @return
     */
    @Override
    public List<UserManageVO> findAllUser(UserRole role, Integer page, Integer size) {
        Integer start = (page - 1) * size;
        return userMapper.findAllUser(role.getRoleCode(), start, size);
    }

    /**
     * 获取用户总数
     * @param role
     * @return
     */
    @Override
    public Integer getUserCountByRole(UserRole role) {
        return userMapper.getUserCountByRole(role.getRoleCode());
    }

    /**
     * 修改用户帐号状态
     * @param status
     * @param id
     */
    @Override
    public void modifyUserStatus(Integer status, String id) {
        userMapper.modifyStatus(status, id);
    }

    /**
     * 删除用户
     * @param id
     */
    @Override
    public void deleteUser(String id) {
        userMapper.deleteUserById(id);
    }

    /**
     * 获取今日新增用户数量
     * @return
     */
    @Override
    public Integer getCurDayUser() {
        return userMapper.getCurDayUserCount();
    }
}
