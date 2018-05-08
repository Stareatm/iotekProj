package com.stareatm.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by 刘 on 2018/5/2.
 */
public class Salary implements Serializable {
    private int s_id;
    private Emp emp;
    private int s_performance;
    private int s_socialSecurity;
    private int s_totalSal;
    private Date s_time;
    private int s_rpSal;
    private int s_status;//0:未申请复议,1:复议未审批,2:复议审批未通过,3:复议审批通过
    private int s_baseSal;

    public Salary(int s_id, Emp emp, int s_performance,int s_socialSecurity, int s_totalSal, Date s_time, int s_rpSal, int s_status, int s_baseSal) {
        this.s_id = s_id;
        this.emp = emp;
        this.s_performance = s_performance;
        this.s_socialSecurity = s_socialSecurity;
        this.s_totalSal = s_totalSal;
        this.s_time = s_time;
        this.s_rpSal = s_rpSal;
        this.s_status = s_status;
        this.s_baseSal = s_baseSal;
    }

    public Salary(int s_id) {

        this.s_id = s_id;
    }

    public Salary() {

    }

    public int getS_id() {
        return s_id;
    }

    public void setS_id(int s_id) {
        this.s_id = s_id;
    }

    public Emp getEmp() {
        return emp;
    }

    public void setEmp(Emp emp) {
        this.emp = emp;
    }

    public int getS_performance() {
        return s_performance;
    }

    public void setS_performance(int s_performance) {
        this.s_performance = s_performance;
    }

    public int getS_socialSecurity() {
        return s_socialSecurity;
    }

    public void setS_socialSecurity(int s_socialSecurity) {
        this.s_socialSecurity = s_socialSecurity;
    }

    public int getS_totalSal() {
        return s_totalSal;
    }

    public void setS_totalSal(int s_totalSal) {
        this.s_totalSal = s_totalSal;
    }

    public Date getS_time() {
        return s_time;
    }

    public void setS_time(Date s_time) {
        this.s_time = s_time;
    }

    public int getS_rpSal() {
        return s_rpSal;
    }

    public void setS_rpSal(int s_rpSal) {
        this.s_rpSal = s_rpSal;
    }

    public int getS_status() {
        return s_status;
    }

    public void setS_status(int s_status) {
        this.s_status = s_status;
    }

    public int getS_baseSal() {
        return s_baseSal;
    }

    public void setS_baseSal(int s_baseSal) {
        this.s_baseSal = s_baseSal;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Salary salary = (Salary) o;

        return s_id == salary.s_id;
    }

    @Override
    public int hashCode() {
        return s_id;
    }

    @Override
    public String toString() {
        return "Salary{" +
                "s_id=" + s_id +
                ", s_performance=" + s_performance +
                ", s_socialSecurity=" + s_socialSecurity +
                ", s_totalSal=" + s_totalSal +
                ", s_time=" + s_time +
                ", s_rpSal=" + s_rpSal +
                ", s_status=" + s_status +
                ", s_baseSal=" + s_baseSal +
                '}';
    }
}
