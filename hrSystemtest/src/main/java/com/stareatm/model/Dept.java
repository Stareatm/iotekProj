package com.stareatm.model;

import java.io.Serializable;

/**
 * Created by 刘 on 2018/4/23.
 */
public class Dept implements Serializable {
    private int d_id;
    private String d_name;

    public Dept(int d_id, String d_name) {
        this.d_id = d_id;
        this.d_name = d_name;
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
