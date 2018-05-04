package com.stareatm.dao;

import com.stareatm.model.Emp;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 刘 on 2018/4/24.
 */
@Repository
public interface EmpMapper {
    boolean addEmp(Emp emp);
    List<Emp> getEmp_JobByJ_ID(Emp emp);
    Emp login(Emp emp);
    boolean updateEmpPassByAccount(Emp emp);
    Emp getEmpByE_account(Emp emp);
    Emp getEmp_JobByE_id(Emp emp);
    boolean updateEmp(Emp emp);
    List<Emp> getAllEmp();
    Emp getFirstHiredEmp();
}
