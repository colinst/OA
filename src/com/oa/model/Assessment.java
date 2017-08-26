package com.oa.model;

import java.util.Date;

public class Assessment {
    private Integer assessmentid;

    private String assessmentname;

    private Date createtime;

    public Integer getAssessmentid() {
        return assessmentid;
    }

    public void setAssessmentid(Integer assessmentid) {
        this.assessmentid = assessmentid;
    }

    public String getAssessmentname() {
        return assessmentname;
    }

    public void setAssessmentname(String assessmentname) {
        this.assessmentname = assessmentname == null ? null : assessmentname.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}