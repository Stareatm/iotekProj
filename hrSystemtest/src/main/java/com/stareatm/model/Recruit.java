package com.stareatm.model;

import java.io.Serializable;

/**
 * Created by 刘 on 2018/4/21.
 */
public class Recruit implements Serializable {
    private int rc_id;
    private String rc_job;
    private String rc_company;
    private int rc_sal;
    private String rc_location;
    private String rc_property;//公司性质
    private String rc_scale;
    private String rc_expTime;
    private String rc_eduBG;
    private String rc_sex;//性别要求
    private String rc_more;//更多信息

    public Recruit(String rc_job, String rc_company, int rc_sal, String rc_location, String rc_property, String rc_scale, String rc_expTime, String rc_eduBG, String rc_sex, String rc_more) {
        this.rc_job = rc_job;
        this.rc_company = rc_company;
        this.rc_sal = rc_sal;
        this.rc_location = rc_location;
        this.rc_property = rc_property;
        this.rc_scale = rc_scale;
        this.rc_expTime = rc_expTime;
        this.rc_eduBG = rc_eduBG;
        this.rc_sex = rc_sex;
        this.rc_more = rc_more;
    }

    public Recruit(int rc_id) {

        this.rc_id = rc_id;
    }

    public Recruit() {

    }

    public int getRc_id() {
        return rc_id;
    }

    public void setRc_id(int rc_id) {
        this.rc_id = rc_id;
    }

    public String getRc_job() {
        return rc_job;
    }

    public void setRc_job(String rc_job) {
        this.rc_job = rc_job;
    }

    public String getRc_company() {
        return rc_company;
    }

    public void setRc_company(String rc_company) {
        this.rc_company = rc_company;
    }

    public int getRc_sal() {
        return rc_sal;
    }

    public void setRc_sal(int rc_sal) {
        this.rc_sal = rc_sal;
    }

    public String getRc_location() {
        return rc_location;
    }

    public void setRc_location(String rc_location) {
        this.rc_location = rc_location;
    }

    public String getRc_property() {
        return rc_property;
    }

    public void setRc_property(String rc_property) {
        this.rc_property = rc_property;
    }

    public String getRc_scale() {
        return rc_scale;
    }

    public void setRc_scale(String rc_scale) {
        this.rc_scale = rc_scale;
    }

    public String getRc_expTime() {
        return rc_expTime;
    }

    public void setRc_expTime(String rc_expTime) {
        this.rc_expTime = rc_expTime;
    }

    public String getRc_eduBG() {
        return rc_eduBG;
    }

    public void setRc_eduBG(String rc_eduBG) {
        this.rc_eduBG = rc_eduBG;
    }

    public String getRc_sex() {
        return rc_sex;
    }

    public void setRc_sex(String rc_sex) {
        this.rc_sex = rc_sex;
    }

    public String getRc_more() {
        return rc_more;
    }

    public void setRc_more(String rc_more) {
        this.rc_more = rc_more;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Recruit recruit = (Recruit) o;

        return rc_id == recruit.rc_id;
    }

    @Override
    public int hashCode() {
        return rc_id;
    }
}
