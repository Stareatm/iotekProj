package com.stareatm.dao;

import com.stareatm.model.Recruit;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 刘 on 2018/4/21.
 */
@Repository
public interface RecruitMapper {
    boolean addRecruit(Recruit recruit);
    List<Recruit> getAllRecruit();
    boolean updateRecruit(Recruit recruit);
    boolean deleteRecruit(Recruit recruit);

    List<Recruit> getAllRecruitByRc_status(Recruit recruit);
}
