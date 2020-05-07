package edu.yonatan.onlinesurvey.vo;

import edu.yonatan.onlinesurvey.entity.AnRadio;

import java.util.Date;
import java.util.List;

public class QuestionVO<E> {
    private String id;

    private String type;

    private String surveyId;

    private String qsItemId;

    private Integer isRequired;

    private Integer isNote;

    private String note;

    private Integer orderId;

    private Date createdDate;

    private String tag;

    private String title;

    private List<E> options;

    private Integer number; // 问卷总题数

    private Integer valid;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSurveyId() {
        return surveyId;
    }

    public void setSurveyId(String surveyId) {
        this.surveyId = surveyId;
    }

    public String getQsItemId() {
        return qsItemId;
    }

    public void setQsItemId(String qsItemId) {
        this.qsItemId = qsItemId;
    }

    public Integer getIsRequired() {
        return isRequired;
    }

    public void setIsRequired(Integer isRequired) {
        this.isRequired = isRequired;
    }

    public Integer getIsNote() {
        return isNote;
    }

    public void setIsNote(Integer isNote) {
        this.isNote = isNote;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<E> getOptions() {
        return options;
    }

    public void setOptions(List<E> options) {
        this.options = options;
    }

    public Integer getNumber() { return number; }

    public void setNumber(Integer number) { this.number = number; }

    public Integer getValid() {
        return valid;
    }

    public void setValid(Integer valid) {
        this.valid = valid;
    }
}
