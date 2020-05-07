package edu.yonatan.onlinesurvey.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import edu.yonatan.onlinesurvey.entity.User;
import edu.yonatan.onlinesurvey.service.TokenService;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;

@Service
public class TokenServiceImpl implements TokenService {
    // 签证密钥
    String secret = "survey.yonatan.cn.secret";
    /**
     * 生成Token
     * @param user
     * @return
     */
    public String getToken(User user) {
        Calendar nowTime = Calendar.getInstance();
        nowTime.add(Calendar.HOUR, 12); // 有效期为12小时
        Date expiresDate = nowTime.getTime();

        String token = "";
        token = JWT.create().withClaim("id",  user.getId()).withClaim("role", user.getRole()).withExpiresAt(expiresDate).sign(Algorithm.HMAC256(secret));
        return token;
    }
}
