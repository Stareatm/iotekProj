package com.stareatm.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by 刘 on 2018/5/4.
 */
public class RewordPunish implements Serializable {
    private int rp_id;
    private Emp emp;
    private Date rp_time;
    private String rp_reason;
    private int rp_rpSal;

    public RewordPunish(int rp_id, Emp emp, Date rp_time, String rp_reason, int rp_rpSal) {
        this.rp_id = rp_id;
        this.emp = emp;
        this.rp_time = rp_time;
        this.rp_reason = rp_reason;
        this.rp_rpSal = rp_rpSal;
    }

    public RewordPunish(int rp_id) {

        this.rp_id = rp_id;
    }

    public RewordPunish() {
    }

    public int getRp_id() {
        return rp_id;
    }

    public void setRp_id(int rp_id) {
        this.rp_id = rp_id;
    }

    public Emp getEmp() {
        return emp;
    }

    public void setEmp(Emp emp) {
        this.emp = emp;
    }

    public Date getRp_time() {
        return rp_time;
    }

    public void setRp_time(Date rp_time) {
        this.rp_time = rp_time;
    }

    public int getRp_rpSal() {
        return rp_rpSal;
    }

    public void setRp_rpSal(int rp_rpSal) {
        this.rp_rpSal = rp_rpSal;
    }

    public String getRp_reason() {
        return rp_reason;
    }

    public void setRp_reason(String rp_reason) {
        this.rp_reason = rp_reason;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RewordPunish that = (RewordPunish) o;

        return rp_id == that.rp_id;
    }

    @Override
    public int hashCode() {
        return rp_id;
    }

    @Override
    public String toString() {
        return "RewordPunish{" +
                "rp_id=" + rp_id +
                ", rp_time=" + rp_time +
                ", rp_reason='" + rp_reason + '\'' +
                ", rp_rpSal=" + rp_rpSal +
                '}';
    }
}
