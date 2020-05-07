package edu.yonatan.onlinesurvey.controller;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.common.utils.Message;
import edu.yonatan.onlinesurvey.annotation.UserLoginToken;
import edu.yonatan.onlinesurvey.entity.SurveyTag;
import edu.yonatan.onlinesurvey.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("tag")
public class TagController {
    @Autowired
    private TagService tagService;

    /**
     * 获取全部标签名称
     * @return
     */
    @UserLoginToken
    @PostMapping("all")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getAllTags() {
        Message message = new Message();
        try {
            List<String> tagList = tagService.getAllTags();
            message.setCode("200");
            message.setMsg("ok");
            message.setData(tagList);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 查询该标签下的问卷
     * @param tag
     * @return
     */
    @UserLoginToken
    @PostMapping("survey")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getAllTags(@RequestParam String tag) {
        Message message = new Message();
        try {
            List<JSONObject> surveyList = tagService.findSurveyListByTag(tag);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(surveyList);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 获取问卷的标签
     * @param surveyId
     * @return
     */
    @UserLoginToken
    @PostMapping("tags")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getSurveyTags(@RequestParam String surveyId) {
        Message message = new Message();
        try {
            List<SurveyTag> tags = tagService.getSurveyTags(surveyId);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(tags);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 添加问卷的标签
     * @param tag
     * @return
     */
    @UserLoginToken
    @PostMapping("add")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message addSurveyTag(@RequestBody SurveyTag tag) {
        Message message = new Message();
        try {
            tagService.addSurveyTags(tag.getSurveyId(), tag.getTagName());
            message.setCode("200");
            message.setMsg("ok");
            message.setData(new ArrayList<>());
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 删除问卷的标签
     * @param id
     * @return
     */
    @UserLoginToken
    @PostMapping("del")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message delSurveyTag(@RequestParam Integer id) {
        Message message = new Message();
        try {
            tagService.deleteSurveyTags(id);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(new ArrayList<>());
        } catch (Exception e) {
            throw e;
        }
        return message;
    }
}
