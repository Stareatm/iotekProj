package com.stareatm.service.impl;

import com.stareatm.dao.ResumeMapper;
import com.stareatm.model.Resume;
import com.stareatm.model.User;
import com.stareatm.service.ResumeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 刘 on 2018/4/22.
 */
@Service
public class ResumeServiceImpl implements ResumeService {
    @Resource
    private ResumeMapper resumeMapper;
    @Override
    public List<Resume> getAllResumeByUser(User user) {
        return resumeMapper.getAllResumeByUser(user);
    }

    @Override
    public boolean updateResume(Resume resume) {
        return resumeMapper.updateResume(resume);
    }

    @Override
    public boolean deleteResume(Resume resume) {
        return resumeMapper.deleteResume(resume);
    }

    @Override
    public boolean addResume(Resume resume) {
        return resumeMapper.addResume(resume);
    }

    @Override
    public Resume getResumeByRs_id(Resume resume) {
        return resumeMapper.getResumeByRs_id(resume);
    }

    @Override
    public List<Resume> getAllResumeByRs_status(Resume resume) {
        return resumeMapper.getAllResumeByRs_status(resume);
    }

    @Override
    public Resume getResume_Interview(Resume resume) {
        return resumeMapper.getResume_Interview(resume);
    }
}
