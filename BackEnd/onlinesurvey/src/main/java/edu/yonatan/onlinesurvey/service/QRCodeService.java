package edu.yonatan.onlinesurvey.service;

public interface QRCodeService {
    // 生成二维码
    String createQRCode(String text) throws Exception;
}
