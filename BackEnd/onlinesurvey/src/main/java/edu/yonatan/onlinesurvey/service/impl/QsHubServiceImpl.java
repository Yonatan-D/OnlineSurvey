package edu.yonatan.onlinesurvey.service.impl;

import edu.yonatan.onlinesurvey.dao.QsCheckboxMapper;
import edu.yonatan.onlinesurvey.dao.QsRadioMapper;
import edu.yonatan.onlinesurvey.dao.QsRateMapper;
import edu.yonatan.onlinesurvey.dao.QsTextareaMapper;
import edu.yonatan.onlinesurvey.entity.QsCheckbox;
import edu.yonatan.onlinesurvey.entity.QsRadio;
import edu.yonatan.onlinesurvey.entity.QsRate;
import edu.yonatan.onlinesurvey.entity.QsTextarea;
import edu.yonatan.onlinesurvey.service.QsHubService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QsHubServiceImpl implements QsHubService {
    @Autowired
    private QsRadioMapper qsRadioMapper;
    @Autowired
    private QsCheckboxMapper qsCheckboxMapper;
    @Autowired
    private QsTextareaMapper qsTextareaMapper;
    @Autowired
    private QsRateMapper qsRateMapper;

    /**
     * 查询单选题题目
     * @param id
     * @return
     */
    @Override
    public String findTitileOfRadio(String id) {
        String title = qsRadioMapper.selectTitleById(id);
        return title;
    }

    /**
     * 查询多选题题目
     * @param id
     * @return
     */
    @Override
    public String findTitileOfCheckbox(String id) {
        String title = qsCheckboxMapper.selectTitleById(id);
        return title;
    }

    /**
     * 查询文本题题目
     * @param id
     * @return
     */
    @Override
    public String findTitileOfTextarea(String id) {
        String title = qsTextareaMapper.selectTitleById(id);
        return title;
    }

    /**
     * 查询评分题题目
     * @param id
     * @return
     */
    @Override
    public String findTitileOfRate(String id) {
        String title = qsRateMapper.selectTitleById(id);
        return title;
    }

    /**
     * 保存单选题题目
     * @param qsRadio
     */
    @Override
    public void saveTitleOfRadio(QsRadio qsRadio) {
        if(qsRadio.getVisibility() == null) {
            qsRadioMapper.updateTitleById(qsRadio);
        }
        else if(qsRadio.getVisibility() == 1) {
            qsRadioMapper.insertQsRadio(qsRadio);
        }
    }

    /**
     * 保存多选题题目
     * @param qsCheckbox
     */
    @Override
    public void saveTitleOfCheckbox(QsCheckbox qsCheckbox) {
        if(qsCheckbox.getVisibility() == null) {
            qsCheckboxMapper.updateTitleById(qsCheckbox);
        }
        else if(qsCheckbox.getVisibility() == 1) {
            qsCheckboxMapper.insertQsCheckbox(qsCheckbox);
        }
    }

    /**
     * 保存文本题题目
     * @param qsTextarea
     */
    @Override
    public void saveTitleOfTextarea(QsTextarea qsTextarea) {
        if(qsTextarea.getVisibility() == null) {
            qsTextareaMapper.updateTitleById(qsTextarea);
        }
        else if(qsTextarea.getVisibility() == 1) {
            qsTextareaMapper.insertQsTextarea(qsTextarea);
        }
    }

    /**
     * 保存评分题题目
     * @param qsRate
     */
    @Override
    public void saveTitleOfRate(QsRate qsRate) {
        if(qsRate.getVisibility() == null) {
            qsRateMapper.updateTitleById(qsRate);
        }
        else if(qsRate.getVisibility() == 1) {
            qsRateMapper.insertQsRate(qsRate);
        }
    }

    /**
     * 删除单选题题目
     * @param id
     */
    @Override
    public void deleteRadio(String id) {
        qsRadioMapper.deleteQsRadioById(id);
    }

    /**
     * 删除多选题题目
     * @param id
     */
    @Override
    public void deleteCheckbox(String id) {
        qsCheckboxMapper.deleteQsCheckboxById(id);
    }

    /**
     * 删除文本题题目
     * @param id
     */
    @Override
    public void deleteTextarea(String id) {
        qsTextareaMapper.deleteQsTextareaById(id);
    }

    /**
     * 删除评分题题目
     * @param id
     */
    @Override
    public void deleteRate(String id) {
        qsRateMapper.deleteQsRateById(id);
    }
}
