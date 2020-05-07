package edu.yonatan.onlinesurvey.entity;

import java.util.ArrayList;

public class Answer<T> {
    private String id;

    private String recycleId;

    private String questionId;

    private String type;

    private T content;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRecycleId() { return recycleId; }

    public void setRecycleId(String recycleId) { this.recycleId = recycleId; }

    public String getQuestionId() { return questionId; }

    public void setQuestionId(String questionId) {
        this.questionId = questionId;
    }

    public String getType() { return type; }

    public void setType(String type) { this.type = type; }

    public T getContent() { return content; }

    public void setContent(T content) { this.content = content; }
}