package edu.yonatan.onlinesurvey.service.impl;

import edu.yonatan.common.utils.MD5Utils;
import edu.yonatan.onlinesurvey.service.PwdService;
import org.springframework.stereotype.Service;

@Service
public class PwdServiceImpl implements PwdService {
    /**
     * 本系统的用户密码加密方式
     * @param password
     * @param salt
     * @return
     */
    @Override
    public String encrypt(String password, String salt) {
        return MD5Utils.encode(MD5Utils.encode(password) + MD5Utils.encode(salt));
    }
}
