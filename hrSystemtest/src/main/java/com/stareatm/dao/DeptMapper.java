package com.stareatm.dao;

import com.stareatm.model.Dept;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 刘 on 2018/4/23.
 */
@Repository
public interface DeptMapper {
    List<Dept> getAllDept();
    Dept getDept_JobByD_name(Dept dept);
}
