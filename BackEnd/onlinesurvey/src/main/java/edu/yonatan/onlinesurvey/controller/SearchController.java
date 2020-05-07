package edu.yonatan.onlinesurvey.controller;

import edu.yonatan.common.utils.Message;
import edu.yonatan.onlinesurvey.annotation.UserLoginToken;
import edu.yonatan.onlinesurvey.service.SearchService;
import edu.yonatan.onlinesurvey.vo.SearchCountVO;
import edu.yonatan.onlinesurvey.vo.SearchServeyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class SearchController {
    @Autowired
    private SearchService searchService;

    /**
     * 获取查询结果总数
     * @param searchText
     * @return
     */
    @UserLoginToken
    @PostMapping("search/count")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message searchResultCounts(@RequestParam String searchText) {
        Message message = new Message();
        try {
            SearchCountVO searchCounts =searchService.findSearchCounts(searchText);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(searchCounts);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 按修改时间排序问卷
     * @param searchText
     * @param page
     * @param size
     * @return
     */
    @UserLoginToken
    @PostMapping("search/serveylist/date")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message searchResultServeysByDate(@RequestParam String searchText, @RequestParam Integer page, @RequestParam Integer size) {
        Message message = new Message();
        try {
            List<SearchServeyVO> searchServeyList =searchService.findSearchServeyListByDate(searchText, page, size);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(searchServeyList);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 按使用数排序问卷
     * @param searchText
     * @param page
     * @param size
     * @return
     */
    @UserLoginToken
    @PostMapping("search/serveylist/quote")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message searchResultServeysByQuote(@RequestParam String searchText, @RequestParam Integer page, @RequestParam Integer size) {
        Message message = new Message();
        try {
            List<SearchServeyVO> searchServeyList =searchService.findSearchServeyListByQuote(searchText, page, size);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(searchServeyList);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }

    /**
     * 按浏览数排序问卷
     * @param searchText
     * @param page
     * @param size
     * @return
     */
    @UserLoginToken
    @PostMapping("search/serveylist/visits")
    @CrossOrigin
    @Transactional(rollbackFor = Exception.class)
    public Message searchResultServeysByVisits(@RequestParam String searchText, @RequestParam Integer page, @RequestParam Integer size) {
        Message message = new Message();
        try {
            List<SearchServeyVO> searchServeyList =searchService.findSearchServeyListByVisits(searchText, page, size);
            message.setCode("200");
            message.setMsg("ok");
            message.setData(searchServeyList);
        } catch (Exception e) {
            throw e;
        }
        return message;
    }
}
