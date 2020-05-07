package edu.yonatan.onlinesurvey.entity;

public class AnRadio {
    private String id;

    private String qsItemId;

    private Integer orderId;

    private Integer visibility;

    private String value;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getQsItemId() {
        return qsItemId;
    }

    public void setQsItemId(String qsItemId) {
        this.qsItemId = qsItemId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getVisibility() {
        return visibility;
    }

    public void setVisibility(Integer visibility) {
        this.visibility = visibility;
    }

    public String getValue() { return value; }

    public void setValue(String value) { this.value = value; }
}