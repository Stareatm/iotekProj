package com.stareatm.service;

import com.stareatm.model.RewordPunish;

import java.util.List;

/**
 * Created by 刘 on 2018/5/4.
 */
public interface RewordPunishService {
    boolean addRP(RewordPunish rewordPunish);
    boolean updateRP(RewordPunish rewordPunish);
    List<RewordPunish> getAllRewordPunishByE_id(RewordPunish rewordPunish);
    RewordPunish geRewordPunishByRp_id(RewordPunish rewordPunish);
    boolean deleteRP(RewordPunish rewordPunish);
}
