package edu.yonatan.onlinesurvey.service;

import edu.yonatan.onlinesurvey.entity.User;

public interface TokenService {
    // 生成Token
    String getToken(User user);
}
