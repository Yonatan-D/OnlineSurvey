package edu.yonatan.onlinesurvey.service.impl;

import edu.yonatan.onlinesurvey.dao.SurveyMapper;
import edu.yonatan.onlinesurvey.dao.SurveyRecycleMapper;
import edu.yonatan.onlinesurvey.entity.Survey;
import edu.yonatan.onlinesurvey.service.RecycleService;
import edu.yonatan.onlinesurvey.service.SearchService;
import edu.yonatan.onlinesurvey.vo.SearchCountVO;
import edu.yonatan.onlinesurvey.vo.SearchServeyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchServiceImpl implements SearchService {
    @Autowired
    private SurveyMapper surveyMapper;
    @Autowired
    private SurveyRecycleMapper surveyRecycleMapper;

    /**
     * 查询不同分类的搜索结果数字
     * @param searchText
     * @return
     */
    @Override
    public SearchCountVO findSearchCounts(String searchText) {
        SearchCountVO searchCounts = new SearchCountVO();
        searchCounts.setSurvey(surveyMapper.selectSurveyCountByTitleAndIntro(searchText));
        searchCounts.setQuest(0);
        searchCounts.setTag(0);
        return searchCounts;
    }

    /**
     * 查询结果列表, 按照修改时间排序
     * @param searchText
     * @param page
     * @param size
     * @return
     */
    @Override
    public List<SearchServeyVO> findSearchServeyListByDate(String searchText, Integer page, Integer size) {
        Integer start = (page - 1) * size;
        List<SearchServeyVO> searchServeyList = surveyMapper.searchTextByDate(searchText, start, size);
        for (SearchServeyVO searchServeyVO:searchServeyList
             ) {
            String surveyId = searchServeyVO.getId();
            Integer recycleCount = surveyRecycleMapper.selectRecyclesCount(surveyId);
            searchServeyVO.setRecycleCount(recycleCount);
        }
        return searchServeyList;
    }

    /**
     * 查询结果列表, 按照使用数排序
     * @param searchText
     * @param page
     * @param size
     * @return
     */
    @Override
    public List<SearchServeyVO> findSearchServeyListByQuote(String searchText, Integer page, Integer size) {
        Integer start = (page - 1) * size;
        List<SearchServeyVO> searchServeyList = surveyMapper.searchTextByQuote(searchText, start, size);
        for (SearchServeyVO searchServeyVO:searchServeyList
        ) {
            String surveyId = searchServeyVO.getId();
            Integer recycleCount = surveyRecycleMapper.selectRecyclesCount(surveyId);
            searchServeyVO.setRecycleCount(recycleCount);
        }
        return searchServeyList;
    }

    /**
     * 查询结果列表, 按照浏览数排序
     * @param searchText
     * @param page
     * @param size
     * @return
     */
    @Override
    public List<SearchServeyVO> findSearchServeyListByVisits(String searchText, Integer page, Integer size) {
        Integer start = (page - 1) * size;
        List<SearchServeyVO> searchServeyList = surveyMapper.searchTextByVisits(searchText, start, size);
        for (SearchServeyVO searchServeyVO:searchServeyList
        ) {
            String surveyId = searchServeyVO.getId();
            Integer recycleCount = surveyRecycleMapper.selectRecyclesCount(surveyId);
            searchServeyVO.setRecycleCount(recycleCount);
        }
        return searchServeyList;
    }
}
