package com.stareatm.model;;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 刘 on 2018/4/23.
 */
public class Job implements Serializable{
    private int j_id;
    private String j_name;
    private Dept dept;
    private List<Emp> empList;

    public Job(int j_id, String j_name, Dept dept, List<Emp> empList) {
        this.j_id = j_id;
        this.j_name = j_name;
        this.dept = dept;
        this.empList = empList;
    }

    public Job(int j_id) {

        this.j_id = j_id;
    }

    public int getJ_id() {
        return j_id;
    }

    public void setJ_id(int j_id) {
        this.j_id = j_id;
    }

    public String getJ_name() {
        return j_name;
    }

    public void setJ_name(String j_name) {
        this.j_name = j_name;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    public List<Emp> getEmpList() {
        return empList;
    }

    public void setEmpList(List<Emp> empList) {
        this.empList = empList;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Job job = (Job) o;

        return j_id == job.j_id;
    }

    @Override
    public int hashCode() {
        return j_id;
    }

    @Override
    public String toString() {
        return "Job{" +
                "j_id=" + j_id +
                ", j_name='" + j_name + '\'' +
                '}';
    }
}
