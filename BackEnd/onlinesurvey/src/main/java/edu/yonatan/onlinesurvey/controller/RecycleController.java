package edu.yonatan.onlinesurvey.controller;

import com.alibaba.fastjson.JSONObject;
import edu.yonatan.common.utils.Message;
import edu.yonatan.onlinesurvey.annotation.UserLoginToken;
import edu.yonatan.onlinesurvey.dao.AnswerMapper;
import edu.yonatan.onlinesurvey.entity.Survey;
import edu.yonatan.onlinesurvey.entity.SurveyRecycle;
import edu.yonatan.onlinesurvey.service.RecycleService;
import edu.yonatan.onlinesurvey.service.SurveyService;
import edu.yonatan.onlinesurvey.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("recycle")
public class RecycleController {
    @Autowired
    private RecycleService recycleService;
    @Autowired
    private SurveyService surveyService;
    @Autowired
    private AnswerMapper answerMapper;

    /**
     * 获取回收答卷的列表
     * @param surveyId
     * @param page
     * @param size
     * @return
     */
    @UserLoginToken
    @PostMapping("/list")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getRecycleList(@RequestParam String surveyId,
                                  @RequestParam Integer page,
                                  @RequestParam Integer size) {
        Message message = new Message();
        try {
            PageVO recyclePageVO = new PageVO();
            List<SurveyRecycle> recycles = recycleService.getRecyclesBySurveyId(surveyId, page, size);
            Integer count = recycleService.getRecyclesCount(surveyId);
            recyclePageVO.setList(recycles);
            recyclePageVO.setCount(count);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(recyclePageVO);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 获取回收答卷详情（选择、评分题等统计部分）
     * @param surveyId
     * @return
     */
    @UserLoginToken
    @PostMapping("/detail/{surveyId}")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getAnswerAndRate(@PathVariable String surveyId) {
        Message message = new Message();
        try {
            List<QuestionVO> questions = recycleService.getAnswersAndStatiste(surveyId);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(questions);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 获取文本题答案列表
     * @param questionId
     * @param page
     * @param size
     * @return
     */
    @UserLoginToken
    @PostMapping("/detail/textarea")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getTextContentList(@RequestParam String questionId,
                                    @RequestParam Integer page,
                                    @RequestParam Integer size) {
        Message message = new Message();
        try {
            PageVO textPageVO = new PageVO();
            List<TextVO> textVOList = recycleService.getTextAnswerDetail(questionId, page, size);
            Integer count = answerMapper.calcTextValidSum(questionId);
            textPageVO.setCount(count);
            textPageVO.setList(textVOList);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(textPageVO);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 获取某一份答卷的答题情况
     * @param recycleId
     * @return
     */
    @UserLoginToken
    @GetMapping("/detail/page/{recycleId}")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getRecyclePage(@PathVariable String recycleId) {
        Message message = new Message();
        try {
            SurveyRecycle detail = recycleService.getRecycleDetail(recycleId);
            List<AnswerPageVO> result = recycleService.getAnswerPageList(detail.getSurveyId(),recycleId);
            Map<String,Object> map = new HashMap<>();
            map.put("detail",detail);
            map.put("result", result);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(map);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 删除答卷
     * @param id
     * @return
     */
    @UserLoginToken
    @GetMapping("/del/{id}")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message deleteRecycle(@PathVariable String id) {
        Message message = new Message();
        try {
            recycleService.deleteRecycleById(id);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(new ArrayList<>());
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 删除问卷对应的所有答卷
     * @param surveyId
     * @return
     */
    @UserLoginToken
    @GetMapping("/refresh/{surveyId}")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message deleteRecycles(@PathVariable String surveyId) {
        Message message = new Message();
        try {
            recycleService.deleteRecyclesBySurveyId(surveyId);
            Survey survey = new Survey();
            survey.setId(surveyId);
            survey.setVisits(0);
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
     * 获取数据统计面板的数字（回收量、浏览量、回收率、平均用时）
     * @param surveyId
     * @return
     */
    @UserLoginToken
    @GetMapping("/panel/{surveyId}")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getPanelNumbers(@PathVariable String surveyId) {
        Message message = new Message();
        try {
            PanelNumVO panelNumVO = recycleService.getPanelNumbers(surveyId);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(panelNumVO);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 获取回收答卷的来源渠道
     * @param surveyId
     * @return
     */
    @UserLoginToken
    @GetMapping("/data_source/{surveyId}")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getRecyclesDataSource(@PathVariable String surveyId) {
        Message message = new Message();
        try {
            List<JSONObject> data = recycleService.getDataSource(surveyId);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(data);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 获取回收答卷的地理位置
     * @param surveyId
     * @return
     */
    @UserLoginToken
    @GetMapping("/map/{surveyId}")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getMapData(@PathVariable String surveyId) {
        Message message = new Message();
        try {
            List<JSONObject> data = recycleService.getMapData(surveyId);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(data);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 交叉分析
     * @param xValue
     * @param yValue
     * @return
     */
    @UserLoginToken
    @PostMapping("/cross_analysis")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message getCrossAnalysisData(@RequestParam String xValue, @RequestParam String yValue) {
        Message message = new Message();
        try {
            JSONObject crossAnalyData = recycleService.getCrossAnalysisData(xValue, yValue);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(crossAnalyData);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }
}
