package edu.yonatan.common.utils;

import org.springframework.util.DigestUtils;

public class MD5Utils {
    /**
     * MD5加密
     * @param text
     * @return
     */
    public static String encode(String text) {
        return DigestUtils.md5DigestAsHex(text.getBytes());
    }
}
