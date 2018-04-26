package com.stareatm.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by 刘 on 2018/4/23.
 */
public class Interview implements Serializable {
    private int i_id;
    private Resume resume;//发送给该简历的邀请表
    private Date i_time;
    private String i_addr;
    private int i_status;//0表示该邀请已发送游客已接收,1表示游客确认面试,2表示已入职
    private String d_name;
    private String j_name;

    public Interview(int i_id, Resume resume, Date i_time, String i_addr, int i_status, String d_name, String j_name) {
        this.i_id = i_id;
        this.resume = resume;
        this.i_time = i_time;
        this.i_addr = i_addr;
        this.i_status = i_status;
        this.d_name = d_name;
        this.j_name = j_name;
    }

    public Interview(int i_id) {

        this.i_id = i_id;
    }

    public Interview() {

    }

    public int getI_id() {
        return i_id;
    }

    public void setI_id(int i_id) {
        this.i_id = i_id;
    }

    public Resume getResume() {
        return resume;
    }

    public void setResume(Resume resume) {
        this.resume = resume;
    }

    public Date getI_time() {
        return i_time;
    }

    public void setI_time(Date i_time) {
        this.i_time = i_time;
    }

    public String getI_addr() {
        return i_addr;
    }

    public void setI_addr(String i_addr) {
        this.i_addr = i_addr;
    }

    public int getI_status() {
        return i_status;
    }

    public void setI_status(int i_status) {
        this.i_status = i_status;
    }

    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }

    public String getJ_name() {
        return j_name;
    }

    public void setJ_name(String j_name) {
        this.j_name = j_name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Interview interview = (Interview) o;

        return i_id == interview.i_id;
    }

    @Override
    public int hashCode() {
        return i_id;
    }

    @Override
    public String toString() {
        return "Interview{" +
                "i_id=" + i_id +
                ", i_time=" + i_time +
                ", i_addr='" + i_addr + '\'' +
                ", i_status=" + i_status +
                ", d_name='" + d_name + '\'' +
                ", j_name='" + j_name + '\'' +
                '}';
    }
}
