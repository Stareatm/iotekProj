package com.stareatm.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by 刘 on 2018/5/3.
 */
public class Attendance implements Serializable {
    private int at_id;
    private Emp emp;
    private Date at_startTime;
    private Date at_endTime;

    public Attendance(int at_id, Emp emp, Date at_startTime, Date at_endTime) {
        this.at_id = at_id;
        this.emp = emp;
        this.at_startTime = at_startTime;
        this.at_endTime = at_endTime;
    }

    public Attendance(int at_id) {
        this.at_id = at_id;
    }

    public Attendance() {

    }

    public int getAt_id() {
        return at_id;
    }

    public void setAt_id(int at_id) {
        this.at_id = at_id;
    }

    public Emp getEmp() {
        return emp;
    }

    public void setEmp(Emp emp) {
        this.emp = emp;
    }

    public Date getAt_startTime() {
        return at_startTime;
    }

    public void setAt_startTime(Date at_startTime) {
        this.at_startTime = at_startTime;
    }

    public Date getAt_endTime() {
        return at_endTime;
    }

    public void setAt_endTime(Date at_endTime) {
        this.at_endTime = at_endTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Attendance that = (Attendance) o;

        return at_id == that.at_id;
    }

    @Override
    public int hashCode() {
        return at_id;
    }

    @Override
    public String toString() {
        return "Attendance{" +
                "at_id=" + at_id +
                ", at_startTime=" + at_startTime +
                ", at_endTime=" + at_endTime +
                '}';
    }
}
