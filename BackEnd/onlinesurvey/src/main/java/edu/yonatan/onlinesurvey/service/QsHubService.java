package edu.yonatan.onlinesurvey.service;

import edu.yonatan.onlinesurvey.entity.QsCheckbox;
import edu.yonatan.onlinesurvey.entity.QsRadio;
import edu.yonatan.onlinesurvey.entity.QsRate;
import edu.yonatan.onlinesurvey.entity.QsTextarea;

public interface QsHubService {
    // 查询单选题题目
    String findTitileOfRadio(String id);
    // 查询多选题题目
    String findTitileOfCheckbox(String id);
    // 查询文本题题目
    String findTitileOfTextarea(String id);
    // 查询评分题题目
    String findTitileOfRate(String id);
    // 保存单选题题目
    void saveTitleOfRadio(QsRadio qsRadio);
    // 保存多选题题目
    void saveTitleOfCheckbox(QsCheckbox qsCheckbox);
    // 保存文本题题目
    void saveTitleOfTextarea(QsTextarea qsTextarea);
    // 保存评分题题目
    void saveTitleOfRate(QsRate qsRate);
    // 删除单选题题目
    void deleteRadio(String id);
    // 删除多选题题目
    void deleteCheckbox(String id);
    // 删除文本题题目
    void deleteTextarea(String id);
    // 删除评分题题目
    void deleteRate(String id);
}
