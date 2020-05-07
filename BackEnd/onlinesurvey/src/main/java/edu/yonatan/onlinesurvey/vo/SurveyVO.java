package edu.yonatan.onlinesurvey.vo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class SurveyVO<E> {
    private String id;

    private String title;

    private String introduction;

    private Integer number;

    private List<QuestionVO> qsitems;

    private Integer totalTime;

//    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Integer enHandle;

//    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date enAnDate;

    private Integer status;

    private Integer quote;

    private String referenceTo;

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

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public List<QuestionVO> getQsitems() { return qsitems; }

    public void setQsitems(List<QuestionVO> qsitems) { this.qsitems = qsitems; }

    public Integer getTotalTime() {
        return totalTime;
    }

    public void setTotalTime(Integer totalTime) {
        this.totalTime = totalTime;
    }

    public Integer getEnHandle() {
        return enHandle;
    }

    public void setEnHandle(Integer enHandle) {
        this.enHandle = enHandle;
    }

    public Date getEnAnDate() {
        return enAnDate;
    }

    public void setEnAnDate(Date enAnDate) {
        this.enAnDate = enAnDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getQuote() {
        return quote;
    }

    public void setQuote(Integer quote) {
        this.quote = quote;
    }

    public String getReferenceTo() {
        return referenceTo;
    }

    public void setReferenceTo(String referenceTo) {
        this.referenceTo = referenceTo;
    }
}
