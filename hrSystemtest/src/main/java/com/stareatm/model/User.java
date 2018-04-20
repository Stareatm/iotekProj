package com.stareatm.model;

import java.io.Serializable;

/**
 * Created by 刘 on 2018/4/20.
 */

public class User implements Serializable{
    private int u_id;
    private String u_name;
    private String u_pass;
    private int u_type;//0表示普通用户,1表示管理员

    public User(int u_id, String u_name, String u_pass, int u_type) {
        this.u_id = u_id;
        this.u_name = u_name;
        this.u_pass = u_pass;
        this.u_type = u_type;
    }

    public User(int u_id) {
        this.u_id = u_id;
    }

    public User() {

    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getU_pass() {
        return u_pass;
    }

    public void setU_pass(String u_pass) {
        this.u_pass = u_pass;
    }

    public int getU_type() {
        return u_type;
    }

    public void setU_type(int u_type) {
        this.u_type = u_type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        return u_id == user.u_id;
    }

    @Override
    public int hashCode() {
        return u_id;
    }

    @Override
    public String toString() {
        return "User{" +
                "u_id=" + u_id +
                ", u_name='" + u_name + '\'' +
                ", u_pass='" + u_pass + '\'' +
                ", u_type=" + u_type +
                '}';
    }
}
