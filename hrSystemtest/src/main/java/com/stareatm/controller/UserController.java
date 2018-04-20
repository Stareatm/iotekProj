package com.stareatm.controller;

import com.stareatm.model.User;
import com.stareatm.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by 刘 on 2018/4/20.
 */
@Controller
@RequestMapping("/userController")
public class UserController {
    @Resource
    private UserService userService;
    @RequestMapping("toPage")
    public String toPage(String choose)throws Exception{
        if("login".equals(choose)){
            return "login";
        }else if ("register".equals(choose)){
            return "register";
        }
        return "../../index";
    }
    @RequestMapping("login")
    public String login(User user, HttpSession session)throws Exception{
        User user1=userService.login(user);
        if (null!=user1){
            session.setAttribute("user",user1);
            if (user1.getU_type()==0) {
                return "userMain";
            }else if (user1.getU_type()==1){
                return "empMain";
            }else{
                return "adminMain";
            }
        }else
        return "loginFailed";
    }
    @RequestMapping("register")
    public String register(User user,HttpSession session)throws Exception{
        User user1=userService.getUserByName(user);
        if(null==user1){
            user.setU_type(0);//用户注册
            userService.addUser(user);
            return "login";
        }
        return "registerFailed";
    }
}
