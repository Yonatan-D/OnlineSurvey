package edu.yonatan.onlinesurvey.vo;

import edu.yonatan.onlinesurvey.entity.Survey;

public class SurveyListVO extends Survey {
    private Integer recycle;

    public Integer getRecycle() {
        return recycle;
    }

    public void setRecycle(Integer recycle) {
        this.recycle = recycle;
    }
}
