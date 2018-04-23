package com.stareatm.service;

import com.stareatm.model.Job;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 刘 on 2018/4/23.
 */
public interface JobService {
    List<Job> getAllJob();
    Job getJobByJ_id(Job job);
}
