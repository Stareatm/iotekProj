package com.stareatm.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by 刘 on 2018/4/27.
 */
public class EmpStatus implements Serializable {
    private int es_id;
    private int e_id;
    private int e_status;
    private String es_reasons;
    private Date es_changeDate;

    public EmpStatus() {
    }

    public EmpStatus(int es_id) {
        this.es_id = es_id;
    }

    public EmpStatus(int es_id, int e_id, int e_status, String es_reasons, Date es_changeDate) {
        this.es_id = es_id;
        this.e_id = e_id;
        this.e_status = e_status;
        this.es_reasons = es_reasons;
        this.es_changeDate = es_changeDate;
    }

    public int getEs_id() {
        return es_id;
    }

    public void setEs_id(int es_id) {
        this.es_id = es_id;
    }

    public int getE_id() {
        return e_id;
    }

    public void setE_id(int e_id) {
        this.e_id = e_id;
    }

    public int getE_status() {
        return e_status;
    }

    public void setE_status(int e_status) {
        this.e_status = e_status;
    }

    public String getEs_reasons() {
        return es_reasons;
    }

    public void setEs_reasons(String es_reasons) {
        this.es_reasons = es_reasons;
    }

    public Date getEs_changeDate() {
        return es_changeDate;
    }

    public void setEs_changeDate(Date es_changeDate) {
        this.es_changeDate = es_changeDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EmpStatus empStatus = (EmpStatus) o;

        return es_id == empStatus.es_id;
    }

    @Override
    public int hashCode() {
        return es_id;
    }

    @Override
    public String toString() {
        return "EmpStatus{" +
                "es_id=" + es_id +
                ", e_id=" + e_id +
                ", e_status=" + e_status +
                ", es_reasons='" + es_reasons + '\'' +
                ", es_changeDate=" + es_changeDate +
                '}';
    }
}
