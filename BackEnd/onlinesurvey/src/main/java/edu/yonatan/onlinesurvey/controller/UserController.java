package edu.yonatan.onlinesurvey.controller;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.common.utils.Message;
import edu.yonatan.onlinesurvey.annotation.OnlyAdmin;
import edu.yonatan.onlinesurvey.annotation.UserLoginToken;
import edu.yonatan.onlinesurvey.config.UserRole;
import edu.yonatan.onlinesurvey.entity.User;
import edu.yonatan.onlinesurvey.service.PwdService;
import edu.yonatan.onlinesurvey.service.TokenService;
import edu.yonatan.onlinesurvey.service.UserService;
import edu.yonatan.onlinesurvey.vo.UserManageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private TokenService tokenService;
    @Autowired
    private PwdService pwdService;

    /**
     * 用户登录
     * @param user
     * @return
     */
    @PostMapping("/login")
    @CrossOrigin
    public Object login(@RequestBody User user) {
        JSONObject jsonObject=new JSONObject();
        User userForBase=userService.findByUsername(user.getUsername());
        if(userForBase == null){
            jsonObject.put("code", "403");
            jsonObject.put("message","用户名或密码错误"); // 登录失败,用户不存在
            return jsonObject;
        } else {
            String pass = user.getPassword(); // 用户输入的密码
            String salt = userForBase.getSalt();
            String passEncry = pwdService.encrypt(pass, salt);
            String passForBase = userForBase.getPassword();
            if (!passEncry.equals(passForBase)){
                jsonObject.put("code", "403");
                jsonObject.put("message","用户名或密码错误"); // 登录失败,密码错误
                return jsonObject;
            } else {
                if(userForBase.getStatus() == 0) {
                    jsonObject.put("code", "403");
                    jsonObject.put("message","您的帐号已被管理员封禁，申诉请联系管理员"); // 登陆失败，账号被封禁
                    return jsonObject;
                }
                // 记录最近一次登录时间
                userService.modifyLastLoginDate(new Date(), userForBase.getId());
                // 生成Token
                String token = tokenService.getToken(userForBase);
                jsonObject.put("code", "200");
                jsonObject.put("message", "ok");
                jsonObject.put("token", token);
                // 只发送可公开使用的信息字段，避免泄露导致安全问题
                JSONObject userJson = new JSONObject();
                userJson.put("id", userForBase.getId());
                userJson.put("username", userForBase.getUsername());
                userJson.put("email", userForBase.getEmail());
                userJson.put("createdDate", userForBase.getCreatedDate());
                userJson.put("lastLoginDate", userForBase.getLastLoginDate());
                userJson.put("role", UserRole.getRoleNameByRoleCode(userForBase.getRole()));
                jsonObject.put("user", userJson);
                return jsonObject;
            }
        }
    }

    /**
     * 用户名查重
     * @param user
     * @return
     */
    @PostMapping("/checkName")
    @CrossOrigin
    public Object existsUsername(@RequestBody User user) {
        JSONObject jsonObject=new JSONObject();
        User userForBase=userService.findByUsername(user.getUsername());
        if(userForBase == null){
            jsonObject.put("code", "200");
            jsonObject.put("message", "ok");
            jsonObject.put("existsName", false); // 用户不存在，允许使用注册
            return jsonObject;
        } else {
            jsonObject.put("code", "200");
            jsonObject.put("message", "ok");
            jsonObject.put("existsName", true); // 用户存在，不允许注册
            return jsonObject;
        }
    }

    /**
     * 用户注册
     * @param user
     * @return
     */
    @PostMapping("/regist")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Object regist(@RequestBody User user) {
        JSONObject jsonObject=new JSONObject();
        try {
            userService.addUser(user);
            jsonObject.put("code", "200");
            jsonObject.put("message", "ok");
            jsonObject.put("message", "注册成功");
        } catch (Exception e) {
            throw e;
        }
        return jsonObject;
    }

    /**
     * 获取系统用户列表
     * @param page
     * @param size
     * @return
     */
    @OnlyAdmin
    @PostMapping("/list")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getUserList(@RequestParam Integer page,
                               @RequestParam Integer size) {
        Message message = new Message();
        try {
            List<UserManageVO> userList = userService.findAllUser(UserRole.ROLE_NORMAL, page, size);
            Integer count = userService.getUserCountByRole(UserRole.ROLE_NORMAL);
            JSONObject data = new JSONObject();
            data.put("userList", userList);
            data.put("count", count);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(data);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 修改用户帐号状态
     * @param userList
     * @return
     */
    @OnlyAdmin
    @PostMapping("/status")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message changeUserStatus(@RequestBody List<User> userList) {
        Message message = new Message();
        try {
            for (User user:userList
                 ) {
                userService.modifyUserStatus(user.getStatus(), user.getId());
            }
            message.setCode("200");
            message.setMsg("ok");
            message.setData(new ArrayList<>());
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 删除用户
     * @param userList
     * @return
     */
    @OnlyAdmin
    @PostMapping("/delete")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message deleteUser(@RequestBody List<User> userList) {
        Message message = new Message();
        try {
            for (User user:userList
            ) {
                userService.deleteUser(user.getId());
            }
            message.setCode("200");
            message.setMsg("ok");
            message.setData(new ArrayList<>());
        } catch (Exception e) {
            throw e;
        }
        return message;
    }
}
