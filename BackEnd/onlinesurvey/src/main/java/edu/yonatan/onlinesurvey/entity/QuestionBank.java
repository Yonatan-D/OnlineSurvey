package edu.yonatan.onlinesurvey.entity;

import java.util.Date;

public class QuestionBank {
    private String id;

    private String belongId;

    private String type;

    private String qsItemId;

    private Date createdDate;

    private String folder;

    //用于接收GROUP_CONCAT查询结果
    private String qsItemIds;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBelongId() {
        return belongId;
    }

    public void setBelongId(String belongId) {
        this.belongId = belongId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getQsItemId() {
        return qsItemId;
    }

    public void setQsItemId(String qsItemId) {
        this.qsItemId = qsItemId;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getFolder() {
        return folder;
    }

    public void setFolder(String folder) {
        this.folder = folder;
    }

    public String getQsItemIds() {
        return qsItemIds;
    }

    public void setQsItemIds(String qsItemIds) {
        this.qsItemIds = qsItemIds;
    }
}
