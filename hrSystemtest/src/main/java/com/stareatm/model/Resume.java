package com.stareatm.model;

import java.io.Serializable;

/**
 * Created by 刘 on 2018/4/22.
 */
public class Resume implements Serializable {
    private int rs_id;
    private User user;
    private String rs_name;
    private String rs_sex;
    private String rs_IDNumber;
    private String rs_birthday;
    private String rs_residence;//户籍
    private String rs_addr;//住址
    private String rs_expTime;//工作年限
    private String rs_phone;
    private String rs_email;
    private String rs_desiredPosition;//期望职位
    private String rs_desiredLocation;//期望工作地点
    private int rs_expectedSal;//期望薪资
    private String rs_careerExp;//工作经历
    private int rs_status=-1;//-1表示未发送,0表示未读，1表示已读,2表示已发送面试邀请
    private Interview interview;

    public Resume(int rs_id, User user, String rs_name, String rs_sex, String rs_IDNumber, String rs_birthday, String rs_residence, String rs_addr, String rs_expTime, String rs_phone, String rs_email, String rs_desiredPosition, String rs_desiredLocation, int rs_expectedSal, String rs_careerExp, int rs_status, Interview interview) {
        this.rs_id = rs_id;
        this.user = user;
        this.rs_name = rs_name;
        this.rs_sex = rs_sex;
        this.rs_IDNumber = rs_IDNumber;
        this.rs_birthday = rs_birthday;
        this.rs_residence = rs_residence;
        this.rs_addr = rs_addr;
        this.rs_expTime = rs_expTime;
        this.rs_phone = rs_phone;
        this.rs_email = rs_email;
        this.rs_desiredPosition = rs_desiredPosition;
        this.rs_desiredLocation = rs_desiredLocation;
        this.rs_expectedSal = rs_expectedSal;
        this.rs_careerExp = rs_careerExp;
        this.rs_status = rs_status;
        this.interview = interview;
    }

    public Resume(int rs_id) {

        this.rs_id = rs_id;
    }

    public Resume() {

    }

    public int getRs_id() {
        return rs_id;
    }

    public void setRs_id(int rs_id) {
        this.rs_id = rs_id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getRs_name() {
        return rs_name;
    }

    public void setRs_name(String rs_name) {
        this.rs_name = rs_name;
    }

    public String getRs_sex() {
        return rs_sex;
    }

    public void setRs_sex(String rs_sex) {
        this.rs_sex = rs_sex;
    }

    public String getRs_IDNumber() {
        return rs_IDNumber;
    }

    public void setRs_IDNumber(String rs_IDNumber) {
        this.rs_IDNumber = rs_IDNumber;
    }

    public String getRs_birthday() {
        return rs_birthday;
    }

    public void setRs_birthday(String rs_birthday) {
        this.rs_birthday = rs_birthday;
    }

    public String getRs_residence() {
        return rs_residence;
    }

    public void setRs_residence(String rs_residence) {
        this.rs_residence = rs_residence;
    }

    public String getRs_addr() {
        return rs_addr;
    }

    public void setRs_addr(String rs_addr) {
        this.rs_addr = rs_addr;
    }

    public String getRs_expTime() {
        return rs_expTime;
    }

    public void setRs_expTime(String rs_expTime) {
        this.rs_expTime = rs_expTime;
    }

    public String getRs_phone() {
        return rs_phone;
    }

    public void setRs_phone(String rs_phone) {
        this.rs_phone = rs_phone;
    }

    public String getRs_email() {
        return rs_email;
    }

    public void setRs_email(String rs_email) {
        this.rs_email = rs_email;
    }

    public String getRs_desiredPosition() {
        return rs_desiredPosition;
    }

    public void setRs_desiredPosition(String rs_desiredPosition) {
        this.rs_desiredPosition = rs_desiredPosition;
    }

    public String getRs_desiredLocation() {
        return rs_desiredLocation;
    }

    public void setRs_desiredLocation(String rs_desiredLocation) {
        this.rs_desiredLocation = rs_desiredLocation;
    }

    public int getRs_expectedSal() {
        return rs_expectedSal;
    }

    public void setRs_expectedSal(int rs_expectedSal) {
        this.rs_expectedSal = rs_expectedSal;
    }

    public String getRs_careerExp() {
        return rs_careerExp;
    }

    public void setRs_careerExp(String rs_careerExp) {
        this.rs_careerExp = rs_careerExp;
    }

    public int getRs_status() {
        return rs_status;
    }

    public void setRs_status(int rs_status) {
        this.rs_status = rs_status;
    }

    public Interview getInterview() {
        return interview;
    }

    public void setInterview(Interview interview) {
        this.interview = interview;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Resume resume = (Resume) o;

        return rs_id == resume.rs_id;
    }

    @Override
    public int hashCode() {
        return rs_id;
    }

    @Override
    public String toString() {
        return "Resume{" +
                "rs_id=" + rs_id +
                ", rs_name='" + rs_name + '\'' +
                ", rs_sex='" + rs_sex + '\'' +
                ", rs_IDNumber='" + rs_IDNumber + '\'' +
                ", rs_birthday='" + rs_birthday + '\'' +
                ", rs_residence='" + rs_residence + '\'' +
                ", rs_addr='" + rs_addr + '\'' +
                ", rs_expTime='" + rs_expTime + '\'' +
                ", rs_phone='" + rs_phone + '\'' +
                ", rs_email='" + rs_email + '\'' +
                ", rs_desiredPosition='" + rs_desiredPosition + '\'' +
                ", rs_desiredLocation='" + rs_desiredLocation + '\'' +
                ", rs_expectedSal=" + rs_expectedSal +
                ", rs_careerExp='" + rs_careerExp + '\'' +
                ", rs_status=" + rs_status +
                '}';
    }
}
