package edu.yonatan.onlinesurvey.vo;

import edu.yonatan.onlinesurvey.entity.Answer;
import edu.yonatan.onlinesurvey.entity.SurveyRecycle;

import java.util.Date;
import java.util.List;

public class RecycleAnswerVO {
    private SurveyRecycle surveyRecycle;

    private List<Answer> answers;

    private String wxUserId;

    public SurveyRecycle getSurveyRecycle() {
        return surveyRecycle;
    }

    public void setSurveyRecycle(SurveyRecycle surveyRecycle) {
        this.surveyRecycle = surveyRecycle;
    }

    public List<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(List<Answer> answers) {
        this.answers = answers;
    }

    public String getWxUserId() { return wxUserId; }

    public void setWxUserId(String wxUserId) { this.wxUserId = wxUserId; }
}
