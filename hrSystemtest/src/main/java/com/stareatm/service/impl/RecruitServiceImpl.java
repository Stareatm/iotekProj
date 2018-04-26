package com.stareatm.service.impl;

import com.stareatm.dao.RecruitMapper;
import com.stareatm.model.Recruit;
import com.stareatm.service.RecruitService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 刘 on 2018/4/21.
 */
@Service
public class RecruitServiceImpl implements RecruitService {
    @Resource
    private RecruitMapper recruitMapper;
    @Override
    public boolean addRecruit(Recruit recruit) {
        return recruitMapper.addRecruit(recruit);
    }

    @Override
    public List<Recruit> getAllRecruit() {
        return recruitMapper.getAllRecruit();
    }

    @Override
    public boolean updateRecruit(Recruit recruit) {
        return recruitMapper.updateRecruit(recruit);
    }

    @Override
    public boolean deleteRecruit(Recruit recruit) {
        return recruitMapper.deleteRecruit(recruit);
    }

    @Override
    public List<Recruit> getAllRecruitByRc_status(Recruit recruit) {
        return recruitMapper.getAllRecruitByRc_status(recruit);
    }
}
