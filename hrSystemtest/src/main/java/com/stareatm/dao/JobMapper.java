package com.stareatm.dao;

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
}
