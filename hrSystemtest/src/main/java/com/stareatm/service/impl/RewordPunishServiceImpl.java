package com.stareatm.service.impl;

import com.stareatm.dao.RewordPunishMapper;
import com.stareatm.model.RewordPunish;
import com.stareatm.service.RewordPunishService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 刘 on 2018/5/4.
 */
@Service
public class RewordPunishServiceImpl implements RewordPunishService{
    @Resource
    private RewordPunishMapper rewordPunishMapper;
    @Override
    public boolean addRP(RewordPunish rewordPunish) {
        return rewordPunishMapper.addRP(rewordPunish);
    }

    @Override
    public boolean updateRP(RewordPunish rewordPunish) {
        return rewordPunishMapper.updateRP(rewordPunish);
    }

    @Override
    public List<RewordPunish> getAllRewordPunishByE_id(RewordPunish rewordPunish) {
        return rewordPunishMapper.getAllRewordPunishByE_id(rewordPunish);
    }

    @Override
    public RewordPunish geRewordPunishByRp_id(RewordPunish rewordPunish) {
        return rewordPunishMapper.geRewordPunishByRp_id(rewordPunish);
    }

    @Override
    public boolean deleteRP(RewordPunish rewordPunish) {
        return rewordPunishMapper.deleteRP(rewordPunish);
    }
}
