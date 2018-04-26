package com.stareatm.service.impl;

import com.stareatm.dao.JobMapper;
import com.stareatm.model.Job;
import com.stareatm.service.JobService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 刘 on 2018/4/23.
 */
@Service
public class JobServiceImpl implements JobService {
    @Resource
    private JobMapper jobMapper;
    @Override
    public List<Job> getAllJob() {
        return jobMapper.getAllJob();
    }

    @Override
    public Job getJobByJ_id(Job job) {
        return jobMapper.getJobByJ_id(job);
    }

    @Override
    public Job getJobByJ_nameD_name(String j_name, String d_name) {
        return jobMapper.getJobByJ_nameD_name(j_name, d_name);
    }

    @Override
    public Job getJob_EmpByJ_id(Job job) {
        return jobMapper.getJob_EmpByJ_id(job);
    }

    @Override
    public boolean addJobByJ_name(Job job) {
        return jobMapper.addJobByJ_name(job);
    }
}
