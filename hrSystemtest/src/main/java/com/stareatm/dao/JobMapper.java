package com.stareatm.dao;

import com.stareatm.model.Dept;
import com.stareatm.model.Job;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 刘 on 2018/4/23.
 */
@Repository
public interface JobMapper {
    List<Job> getAllJob();
    Job getJobByJ_id(Job job);
    Job getJobByJ_nameD_name(Job job, Dept dept);
    Job getJob_EmpByJ_id(Job job);//查职位下的员工
}
