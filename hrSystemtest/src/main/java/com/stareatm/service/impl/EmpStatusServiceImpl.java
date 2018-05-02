package com.stareatm.service.impl;

import com.stareatm.dao.EmpStatusMapper;
import com.stareatm.model.EmpStatus;
import com.stareatm.service.EmpStatusService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 刘 on 2018/4/27.
 */
@Service
public class EmpStatusServiceImpl implements EmpStatusService {
    @Resource
    private EmpStatusMapper empStatusMapper;
    @Override
    public boolean addEmpStatus(EmpStatus empStatus) {
        return empStatusMapper.addEmpStatus(empStatus);
    }

    @Override
    public List<EmpStatus> getEmpStatusByE_id(EmpStatus empStatus) {
        return empStatusMapper.getEmpStatusByE_id(empStatus);
    }
}
