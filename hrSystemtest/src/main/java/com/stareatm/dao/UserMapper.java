package com.stareatm.dao;

import com.stareatm.model.User;
import org.springframework.stereotype.Repository;

/**
 * Created by 刘 on 2018/4/20.
 */
@Repository
public interface UserMapper {
    User login(User user);

    User getUserByName(User user);

    boolean addUser(User user);
}
