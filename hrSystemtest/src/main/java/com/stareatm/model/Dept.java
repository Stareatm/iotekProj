package com.stareatm.model;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 刘 on 2018/4/23.
 */
public class Dept implements Serializable {
    private int d_id;
    private String d_name;
    private List<Job> jobList;


    public Dept(int d_id, String d_name, List<Job> jobList) {
        this.d_id = d_id;
        this.d_name = d_name;
        this.jobList = jobList;
    }

    public Dept(int d_id) {

        this.d_id = d_id;
    }

    public Dept() {

    }

    public int getD_id() {
        return d_id;
    }

    public void setD_id(int d_id) {
        this.d_id = d_id;
    }

    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }

    public List<Job> getJobList() {
        return jobList;
    }

    public void setJobList(List<Job> jobList) {
        this.jobList = jobList;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Dept dept = (Dept) o;

        return d_id == dept.d_id;
    }

    @Override
    public int hashCode() {
        return d_id;
    }

    @Override
    public String toString() {
        return "Dept{" +
                "d_id=" + d_id +
                ", d_name='" + d_name + '\'' +
                '}';
    }
}
