package com.stareatm.dao;

import com.stareatm.model.Interview;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 刘 on 2018/4/23.
 */
@Repository
public interface InterviewMapper {
    boolean addInterview(Interview interview);
    boolean updateInterview(Interview interview);
    Interview getInterviewByRs_id(Interview interview);
    List<Interview> getInterview_RsByI_status(Interview interview);
    Interview getInterview_Rs(Interview interview);
}
