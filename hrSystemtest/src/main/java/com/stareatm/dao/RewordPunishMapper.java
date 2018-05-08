package com.stareatm.dao;

import com.stareatm.model.RewordPunish;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 刘 on 2018/5/4.
 */
@Repository
public interface RewordPunishMapper {
    boolean addRP(RewordPunish rewordPunish);
    boolean updateRP(RewordPunish rewordPunish);
    List<RewordPunish> getAllRewordPunishByE_id(RewordPunish rewordPunish);
    RewordPunish geRewordPunishByRp_id(RewordPunish rewordPunish);
    boolean deleteRP(RewordPunish rewordPunish);
}
