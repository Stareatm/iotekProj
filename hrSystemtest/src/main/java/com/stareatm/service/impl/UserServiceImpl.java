package com.stareatm.service.impl;

import com.stareatm.dao.UserMapper;
import com.stareatm.model.User;
import com.stareatm.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by 刘 on 2018/4/20.
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    @Override
    public User login(User user) {
        return userMapper.login(user);
    }

    @Override
    public User getUserByName(User user) {
        return userMapper.getUserByName(user);
    }

    @Override
    public boolean addUser(User user) {
        return userMapper.addUser(user);
    }
}
