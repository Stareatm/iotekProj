package com.stareatm.service;

import com.stareatm.model.User;

/**
 * Created by 刘 on 2018/4/20.
 */
public interface UserService {
    User login(User user);

    User getUserByName(User user);

    boolean addUser(User user);

    boolean updateUserPassByName(User user);
}
