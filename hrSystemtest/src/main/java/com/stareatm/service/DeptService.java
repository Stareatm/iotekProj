package com.stareatm.service;

import com.stareatm.model.Dept;

import java.util.List;

/**
 * Created by 刘 on 2018/4/23.
 */
public interface DeptService {
    List<Dept> getAllDept();
    Dept getDept_JobByD_name(Dept dept);
    Dept getDeptByD_name(Dept dept);
    boolean addDept(Dept dept);
}
