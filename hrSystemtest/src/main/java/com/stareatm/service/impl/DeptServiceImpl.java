package com.stareatm.service.impl;

import com.stareatm.dao.DeptMapper;
import com.stareatm.model.Dept;
import com.stareatm.service.DeptService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 刘 on 2018/4/23.
 */
@Service
public class DeptServiceImpl implements DeptService {
    @Resource
    private DeptMapper deptMapper;
    @Override
    public List<Dept> getAllDept() {
        return deptMapper.getAllDept();
    }

    @Override
    public Dept getDept_JobByD_name(Dept dept) {
        return deptMapper.getDept_JobByD_name(dept);
    }

    @Override
    public Dept getDeptByD_name(Dept dept) {
        return deptMapper.getDeptByD_name(dept);
    }

    @Override
    public boolean addDept(Dept dept) {
        return deptMapper.addDept(dept);
    }

    @Override
    public boolean deleteDeptByD_name(Dept dept) {
        return deptMapper.deleteDeptByD_name(dept);
    }

    @Override
    public Dept getDeptByD_id(Dept dept) {
        return deptMapper.getDeptByD_id(dept);
    }
}
