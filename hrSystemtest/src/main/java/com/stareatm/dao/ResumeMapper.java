package com.stareatm.dao;

import com.stareatm.model.Resume;
import com.stareatm.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 刘 on 2018/4/22.
 */
@Repository
public interface ResumeMapper {
    List<Resume> getAllResumeByUser(User user);
    boolean updateResume(Resume resume);
    boolean deleteResume(Resume resume);
    boolean addResume(Resume resume);
    Resume getResumeByRs_id(Resume resume);
    List<Resume> getAllResumeByRs_status(Resume resume);
    Resume getResume_Interview(Resume resume);
    List<Resume> getAllResumeByPhone(Resume resume);
}
