package com.stareatm.service;

import com.stareatm.model.Dept;
import com.stareatm.model.Job;

import java.util.List;

/**
 * Created by 刘 on 2018/4/23.
 */
public interface JobService {
    List<Job> getAllJob();
    Job getJobByJ_id(Job job);
    Job getJobByJ_nameD_name(Job job, Dept dept);
    Job getJob_EmpByJ_id(Job job);
}
