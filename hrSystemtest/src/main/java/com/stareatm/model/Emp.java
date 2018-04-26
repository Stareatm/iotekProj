package com.stareatm.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by 刘 on 2018/4/24.
 */
public class Emp implements Serializable{
    private int e_id;
    private String e_name;
    private String e_sex;
    private String e_IDNumber;
    private String e_phone;
    private String e_addr;
    private Date e_birthday;
    private String e_email;
    private Job job;
    private int e_baseSal;
    private Date e_hireDate;
    private int e_status;//员工状态,0:试用期,1:在职,2:离职
    private String e_account;//账号
    private String e_pass;//密码
    public Emp(int e_id, String e_name, String e_sex, String e_IDNumber, String e_phone, String e_addr, Date e_birthday, String e_email, Job job, int e_baseSal, Date e_hireDate, int e_status) {
        this.e_id = e_id;
        this.e_name = e_name;
        this.e_sex = e_sex;
        this.e_IDNumber = e_IDNumber;
        this.e_phone = e_phone;
        this.e_addr = e_addr;
        this.e_birthday = e_birthday;
        this.e_email = e_email;
        this.job = job;
        this.e_baseSal = e_baseSal;
        this.e_hireDate = e_hireDate;
        this.e_status = e_status;
    }

    public Emp(int e_id) {

        this.e_id = e_id;
    }

    public Emp() {

    }

    public int getE_id() {
        return e_id;
    }

    public void setE_id(int e_id) {
        this.e_id = e_id;
    }

    public String getE_name() {
        return e_name;
    }

    public void setE_name(String e_name) {
        this.e_name = e_name;
    }

    public String getE_sex() {
        return e_sex;
    }

    public void setE_sex(String e_sex) {
        this.e_sex = e_sex;
    }

    public String getE_IDNumber() {
        return e_IDNumber;
    }

    public void setE_IDNumber(String e_IDNumber) {
        this.e_IDNumber = e_IDNumber;
    }

    public String getE_phone() {
        return e_phone;
    }

    public void setE_phone(String e_phone) {
        this.e_phone = e_phone;
    }

    public String getE_addr() {
        return e_addr;
    }

    public void setE_addr(String e_addr) {
        this.e_addr = e_addr;
    }

    public Date getE_birthday() {
        return e_birthday;
    }

    public void setE_birthday(Date e_birthday) {
        this.e_birthday = e_birthday;
    }

    public String getE_email() {
        return e_email;
    }

    public void setE_email(String e_email) {
        this.e_email = e_email;
    }

    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }

    public int getE_baseSal() {
        return e_baseSal;
    }

    public void setE_baseSal(int e_baseSal) {
        this.e_baseSal = e_baseSal;
    }

    public Date getE_hireDate() {
        return e_hireDate;
    }

    public void setE_hireDate(Date e_hireDate) {
        this.e_hireDate = e_hireDate;
    }

    public int getE_status() {
        return e_status;
    }

    public void setE_status(int e_status) {
        this.e_status = e_status;
    }

    public String getE_account() {
        return e_account;
    }

    public void setE_account(String e_account) {
        this.e_account = e_account;
    }

    public String getE_pass() {
        return e_pass;
    }

    public void setE_pass(String e_pass) {
        this.e_pass = e_pass;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Emp emp = (Emp) o;

        return e_id == emp.e_id;
    }

    @Override
    public int hashCode() {
        return e_id;
    }

    @Override
    public String toString() {
        return "Emp{" +
                "e_id=" + e_id +
                ", e_name='" + e_name + '\'' +
                ", e_sex='" + e_sex + '\'' +
                ", e_IDNumber='" + e_IDNumber + '\'' +
                ", e_phone='" + e_phone + '\'' +
                ", e_addr='" + e_addr + '\'' +
                ", e_birthday=" + e_birthday +
                ", e_email='" + e_email + '\'' +
                ", e_baseSal=" + e_baseSal +
                ", e_hireDate=" + e_hireDate +
                ", e_status=" + e_status +
                ", e_account='" + e_account + '\'' +
                ", e_pass='" + e_pass + '\'' +
                '}';
    }
}

