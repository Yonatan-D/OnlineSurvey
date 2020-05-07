package edu.yonatan.onlinesurvey.controller;

import edu.yonatan.common.utils.Message;
import edu.yonatan.onlinesurvey.annotation.UserLoginToken;
import edu.yonatan.onlinesurvey.service.QRCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class QRCodeController {
    @Autowired
    private QRCodeService qrCodeService;

    /**
     * 生成问卷地址跳转的二维码
     * @param surveyUrl
     * @return
     */
    @UserLoginToken
    @PostMapping("publish/getQRCode")
    @CrossOrigin
    public Message createSurveyQRCode(@RequestParam String surveyUrl) throws Exception {
        String imageBase64 = "data:image/png;base64," + qrCodeService.createQRCode(surveyUrl);
        Message message = new Message();
        message.setCode("200");
        message.setMsg("ok");
        message.setData(imageBase64);
        return message;
    }
}
