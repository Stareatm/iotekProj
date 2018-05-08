package com.stareatm.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 刘 on 2018/5/1.
 */
public class Training implements Serializable {
    private int t_id;
    private String t_theme;
    private Dept dept;
    private Date t_beginTime;
    private String t_content;
    private String t_addr;
    private Date t_endTime;

    public Training(int t_id, String t_theme, Dept dept, Date t_beginTime, String t_content, String t_addr, Date t_endTime) {
        this.t_id = t_id;
        this.t_theme = t_theme;
        this.dept = dept;
        this.t_beginTime = t_beginTime;
        this.t_content = t_content;
        this.t_addr = t_addr;
        this.t_endTime = t_endTime;
    }

    public Training(int t_id) {

        this.t_id = t_id;
    }

    public Training() {

    }

    public int getT_id() {
        return t_id;
    }

    public void setT_id(int t_id) {
        this.t_id = t_id;
    }

    public String getT_theme() {
        return t_theme;
    }

    public void setT_theme(String t_theme) {
        this.t_theme = t_theme;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    public Date getT_beginTime() {
        return t_beginTime;
    }

    public void setT_beginTime(Date t_beginTime) {
        this.t_beginTime = t_beginTime;
    }

    public String getT_content() {
        return t_content;
    }

    public void setT_content(String t_content) {
        this.t_content = t_content;
    }

    public String getT_addr() {
        return t_addr;
    }

    public void setT_addr(String t_addr) {
        this.t_addr = t_addr;
    }

    public Date getT_endTime() {
        return t_endTime;
    }

    public void setT_endTime(Date t_endTime) {
        this.t_endTime = t_endTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Training training = (Training) o;

        return t_id == training.t_id;
    }

    @Override
    public int hashCode() {
        return t_id;
    }

    @Override
    public String toString() {
        return "Training{" +
                "t_id=" + t_id +
                ", t_theme='" + t_theme + '\'' +
                ", t_beginTime=" + t_beginTime +
                ", t_content='" + t_content + '\'' +
                ", t_addr='" + t_addr + '\'' +
                ", t_endTime=" + t_endTime +
                '}';
    }
}
