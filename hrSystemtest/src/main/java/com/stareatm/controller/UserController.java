package com.stareatm.controller;

import com.stareatm.model.User;
import com.stareatm.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        }else if ("showUserInfo".equals(choose)){
            return "showUserInfo";
        }else if ("updateUserPass".equals(choose)){
            return "updateUserPass";
        }else if ("userMain".equals(choose)){
            return "userMain";
        }
        return "../../index";
    }
    @RequestMapping("login")
    public String login(User user, HttpSession session,Model model)throws Exception{
        User user1=userService.login(user);
        if (null!=user1){
            session.setAttribute("user",user1);
            if (user1.getU_type()==0) {
                return "userMain";
            }else{
                return "adminMain";
            }
        }
        model.addAttribute("userOrAdminLoginError","×用户名或密码错误,登录失败!");
        return "login";
    }
    @RequestMapping("register")
    public String register(User user, HttpSession session, Model model)throws Exception{
        User user1=userService.getUserByName(user);
        if(null==user1){
            user.setU_type(0);//用户注册
            userService.addUser(user);
            return "login";
        }
        model.addAttribute("registerError","×用户名已存在,注册失败!");
        return "register";
    }
    @RequestMapping("updateUserPass")
    public String updateUserPass(HttpSession session,Model model,String oldPass,String newPass,String rePass)throws Exception{
        User user= (User) session.getAttribute("user");
        if (oldPass.equals(user.getU_pass())&&newPass.equals(rePass)){
            user.setU_pass(newPass);
            userService.updateUserPassByName(user);
            model.addAttribute("updateUserPassSucceed","修改密码成功!");
            return "showUserInfo";
        }
        model.addAttribute("updateUserPassError","原密码不正确或者两次新密码不一致!");
        return "updateUserPass";
    }
}
