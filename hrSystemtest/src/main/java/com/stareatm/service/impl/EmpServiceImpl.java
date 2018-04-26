package com.stareatm.service.impl;

import com.stareatm.dao.EmpMapper;
import com.stareatm.model.Emp;
import com.stareatm.service.EmpService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 刘 on 2018/4/24.
 */
@Service
public class EmpServiceImpl implements EmpService {
    @Resource
    private EmpMapper empMapper;
    @Override
    public boolean addEmp(Emp emp) {
        return empMapper.addEmp(emp);
    }

    @Override
    public List<Emp> getEmp_JobByJ_ID(Emp emp) {
        return empMapper.getEmp_JobByJ_ID(emp);
    }

    @Override
    public Emp login(Emp emp) {
        return empMapper.login(emp);
    }

    @Override
    public boolean updateEmpPassByAccount(Emp emp) {
        return empMapper.updateEmpPassByAccount(emp);
    }

    @Override
    public Emp getEmpByE_account(Emp emp) {
        return empMapper.getEmpByE_account(emp);
    }
}
