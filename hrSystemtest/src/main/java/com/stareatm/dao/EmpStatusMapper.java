package com.stareatm.dao;

import com.stareatm.model.EmpStatus;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 刘 on 2018/4/27.
 */
@Repository
public interface EmpStatusMapper {
    boolean addEmpStatus(EmpStatus empStatus);

    List<EmpStatus> getEmpStatusByE_id(EmpStatus empStatus);
}
