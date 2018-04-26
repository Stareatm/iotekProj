package com.stareatm.service;

import com.stareatm.model.Interview;

import java.util.List;

/**
 * Created by 刘 on 2018/4/23.
 */
public interface InterviewService {
    boolean addInterview(Interview interview);
    boolean updateInterview(Interview interview);
    List<Interview> getInterview_RsByI_status(Interview interview);
    Interview getInterview_Rs(Interview interview);
}
