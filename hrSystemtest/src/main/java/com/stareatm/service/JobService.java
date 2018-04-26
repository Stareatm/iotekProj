package com.stareatm.service;

import com.stareatm.model.Job;

import java.util.List;

/**
 * Created by 刘 on 2018/4/23.
 */
public interface JobService {
    List<Job> getAllJob();
    Job getJobByJ_id(Job job);
    Job getJobByJ_nameD_name(String j_name, String d_name);
    Job getJob_EmpByJ_id(Job job);

    boolean addJobByJ_name(Job job);
}
