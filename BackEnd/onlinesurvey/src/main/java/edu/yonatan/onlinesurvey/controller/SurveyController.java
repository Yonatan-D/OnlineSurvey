package edu.yonatan.onlinesurvey.controller;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.common.utils.Message;
import edu.yonatan.onlinesurvey.annotation.OnlyAdmin;
import edu.yonatan.onlinesurvey.annotation.PassToken;
import edu.yonatan.onlinesurvey.annotation.UserLoginToken;
import edu.yonatan.onlinesurvey.entity.Survey;
import edu.yonatan.onlinesurvey.service.RecycleService;
import edu.yonatan.onlinesurvey.service.SurveyService;
import edu.yonatan.onlinesurvey.vo.RecycleAnswerVO;
import edu.yonatan.onlinesurvey.vo.SurveyListVO;
import edu.yonatan.onlinesurvey.vo.SurveyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
public class SurveyController {
    @Autowired
    private SurveyService surveyService;
    @Autowired
    private RecycleService recycleService;

    /**
     * 被调查者获取问卷
     * @param id
     * @return
     */
    @PassToken
    @GetMapping("survey/{id}")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getSurvey(@PathVariable String id) {
        Message message = new Message();
        try {
            SurveyVO surveyVO = surveyService.getSurveyVOById(id);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(surveyVO);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 增加问卷浏览数
     * @param id
     * @return
     */
    @PassToken
    @GetMapping("survey/visits/{id}")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message increasedVisits(@PathVariable String id) {
        Message message = new Message();
        try {
            surveyService.addVisits(id);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(new ArrayList<>());
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 保存被调查者提交的答卷
     * @param recycleAnswerVO
     * @return
     */
    @PassToken
    @PostMapping("answer")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message submitAnswer(@RequestBody RecycleAnswerVO recycleAnswerVO) {
        Message message = new Message();
        try {
            surveyService.saveSurveyOfRecycle(recycleAnswerVO);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(new ArrayList<>());
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 获取用户创建的问卷列表
     * @param id
     * @return
     */
    @UserLoginToken
    @GetMapping("survey/list/{id}")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getSurveyList(@PathVariable String id) {
        Message message = new Message();
        try {
            List<SurveyListVO> surveys = surveyService.getSurveysByCreator(id);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(surveys);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 保存问卷信息的修改
     * @param survey
     * @return
     */
    @UserLoginToken
    @PostMapping("save/survey/info")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message saveSurveyTitleOrIntro(@RequestBody Survey survey) {
        Message message = new Message();
        try {
            survey.setUpdateDate(new Date()); // 更新问卷的修改时间
            surveyService.modifySurveyInfoOfEdit(survey);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(new ArrayList<>());
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 创建新的空白问卷
     * @param survey
     * @return
     */
    @UserLoginToken
    @PostMapping("survey/new/blank")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message createNewBlankSurvey(@RequestBody Survey survey) {
        Message message = new Message();
        try {
            survey.setUpdateDate(new Date());// 更新问卷的修改时间
            String creator = survey.getCreator();
            String surveyId = surveyService.newBlankSurvey(creator);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(surveyId);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

//    /**
//     * 选择模板创建问卷-A-引用问卷
//     * @param surveyId
//     * @param creator
//     * @return
//     */
//    @UserLoginToken
//    @PostMapping("survey/template/quote")
//    @CrossOrigin
//    @Transactional(rollbackFor = Exception.class)
//    public Message createQuoteTemplateSurvey(@RequestParam String surveyId, @RequestParam String creator) {
//        Message message = new Message();
//        try {
//            String newSurveyId = surveyService.quoteTemplateSurvey(surveyId, creator);
//            message.setCode("200");
//            message.setMsg("ok");
//            message.setData(newSurveyId);
//            // 给问卷的引用数增加1
//            surveyService.addQuote(surveyId);
//        } catch (Exception e) {
//            throw e;
//        }
//        return message;
//    }

    /**
     * 选择模板创建问卷-B-创建新问卷
     * @param surveyId
     * @param creator
     * @return
     */
    @UserLoginToken
    @PostMapping("survey/template/new")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message createNewTemplateSurvey(@RequestParam String surveyId, @RequestParam String creator) {
        Message message = new Message();
        try {
            String newSurveyId = surveyService.newTemplateSurvey(surveyId, creator);
            // 其他人复制问卷增加原卷使用数
            Survey survey = surveyService.getSurvey(surveyId);
            if(!survey.getCreator().equals(creator)) {
                surveyService.addQuote(surveyId);
            }
            message.setCode("200");
            message.setMsg("ok");
            message.setData(newSurveyId);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 删除问卷
     * @param id
     * @return
     */
    @UserLoginToken
    @GetMapping("survey/del/{id}")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message deleteSurvey(@PathVariable String id) {
        Message message = new Message();
        try {
            recycleService.deleteRecyclesBySurveyId(id); // 删除问卷对应的所有答卷
            surveyService.deleteSurveyById(id);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(new ArrayList<>());
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 发布或暂停问卷回收
     * @param survey
     * @return
     */
    @UserLoginToken
    @PostMapping("survey/publish")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message switchPublishStatus(@RequestBody Survey survey) {
        Message message = new Message();
        try {
            surveyService.modifySurveyInfoOfEdit(survey);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(new ArrayList<>());
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 获取问卷信息
     * @param surveyId
     * @return
     */
    @UserLoginToken
    @GetMapping("survey/status/{surveyId}")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getSurveyStatus(@PathVariable String surveyId) {
        Message message = new Message();
        try {
            Survey survey = surveyService.getSurvey(surveyId);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(survey);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 获取系统问卷列表
     * @param page
     * @param size
     * @return
     */
    @OnlyAdmin
    @PostMapping("survey/manage/list")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getSurveyManageList(@RequestParam Integer page,
                                       @RequestParam Integer size) {
        Message message = new Message();
        try {
            List<Survey> surveyList = surveyService.findAllSurvey(page, size);
            Integer count = surveyService.getSurveyCount();
            JSONObject data = new JSONObject();
            data.put("surveyList", surveyList);
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
     * 修改问卷状态
     * @param surveyList
     * @return
     */
    @OnlyAdmin
    @PostMapping("survey/visibility")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message changeSurveyVisibility(@RequestBody List<Survey> surveyList) {
        Message message = new Message();
        try {
            for (Survey survey:surveyList
                 ) {
                surveyService.modifySurveyInfoOfEdit(survey);
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
     * 批量删除问卷
     * @param surveyList
     * @return
     */
    @OnlyAdmin
    @PostMapping("survey/mulit_delete")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message deleteMulitSurvey(@RequestBody List<Survey> surveyList) {
        Message message = new Message();
        try {
            for (Survey survey:surveyList
                 ) {
                recycleService.deleteRecyclesBySurveyId(survey.getId()); // 删除问卷对应的所有答卷
                surveyService.deleteSurveyById(survey.getId());
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
