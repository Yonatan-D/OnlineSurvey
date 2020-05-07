package edu.yonatan.onlinesurvey.vo;

import java.util.Date;

public class TextVO {
    private Date submitDate;

    private String content;

    private String recycleId;

    public Date getSubmitDate() {
        return submitDate;
    }

    public void setSubmitDate(Date submitDate) {
        this.submitDate = submitDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRecycleId() {
        return recycleId;
    }

    public void setRecycleId(String recycleId) {
        this.recycleId = recycleId;
    }
}
