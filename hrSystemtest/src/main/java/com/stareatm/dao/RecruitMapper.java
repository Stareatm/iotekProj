package com.stareatm.dao;

import com.stareatm.model.Recruit;

import java.util.List;

/**
 * Created by 刘 on 2018/4/21.
 */
public interface RecruitMapper {
    boolean addRecruit(Recruit recruit);
    List<Recruit> getAllRecruit();
    boolean updateRecruit(Recruit recruit);
    boolean deleteRecruit(Recruit recruit);
}
