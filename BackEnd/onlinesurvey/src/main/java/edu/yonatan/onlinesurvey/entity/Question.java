package edu.yonatan.onlinesurvey.entity;

import java.util.Date;

public class Question {
    private String id;

    private String type;

    private String surveyId;

    private String qsItemId;

    private Integer isRequired;

    private Integer isNote;

    private Integer orderId;

    private Date createdDate;

    private String tag;

    private String note;

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

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}