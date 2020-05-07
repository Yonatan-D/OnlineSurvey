package edu.yonatan.onlinesurvey.service;

import edu.yonatan.onlinesurvey.vo.SearchCountVO;
import edu.yonatan.onlinesurvey.vo.SearchServeyVO;

import java.util.List;

public interface SearchService {
    // 查询不同分类的搜索结果数字
    SearchCountVO findSearchCounts(String searchText);
    // 查询结果列表, 按照修改时间排序
    List<SearchServeyVO> findSearchServeyListByDate(String searchText, Integer page, Integer size);
    // 查询结果列表, 按照使用数排序
    List<SearchServeyVO> findSearchServeyListByQuote(String searchText, Integer page, Integer size);
    // 查询结果列表, 按照浏览数排序
    List<SearchServeyVO> findSearchServeyListByVisits(String searchText, Integer page, Integer size);
}
