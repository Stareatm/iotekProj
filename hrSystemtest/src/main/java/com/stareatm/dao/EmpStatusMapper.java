package com.stareatm.dao;

import com.stareatm.model.EmpStatus;

import java.util.List;

/**
 * Created by 刘 on 2018/4/27.
 */
public interface EmpStatusMapper {
    boolean addEmpStatus(EmpStatus empStatus);

    List<EmpStatus> getEmpStatusByE_id(EmpStatus empStatus);
}
