package com.stareatm.service.impl;

import com.stareatm.dao.InterviewMapper;
import com.stareatm.model.Interview;
import com.stareatm.service.InterviewService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 刘 on 2018/4/23.
 */
@Service
public class InterviewServiceImpl implements InterviewService {
    @Resource
    private InterviewMapper interviewMapper;
    @Override
    public boolean addInterview(Interview interview) {
        return interviewMapper.addInterview(interview);
    }

    @Override
    public boolean updateInterview(Interview interview) {
        return interviewMapper.updateInterview(interview);
    }

    @Override
    public List<Interview> getInterview_RsByI_status(Interview interview) {
        return interviewMapper.getInterview_RsByI_status(interview);
    }

    @Override
    public Interview getInterview_Rs(Interview interview) {
        return interviewMapper.getInterview_Rs(interview);
    }
}
