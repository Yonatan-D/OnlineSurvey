package edu.yonatan.onlinesurvey.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SearchServeyVO {
    private String id;

    private String title;

    private String introduction;

    private Date updateDate;

    private Integer visits;

    private Integer quote;

    private Integer recycleCount;

    private String tags;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Integer getVisits() {
        return visits;
    }

    public void setVisits(Integer visits) {
        this.visits = visits;
    }

    public Integer getQuote() {
        return quote;
    }

    public void setQuote(Integer quote) {
        this.quote = quote;
    }

    public Integer getRecycleCount() {
        return recycleCount;
    }

    public void setRecycleCount(Integer recycleCount) {
        this.recycleCount = recycleCount;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }
}
