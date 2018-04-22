package com.stareatm.controller;

import com.stareatm.model.Resume;
import com.stareatm.model.User;
import com.stareatm.service.ResumeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 刘 on 2018/4/22.
 */
@Controller
@RequestMapping("/resumeController")
public class ResumeController {
    @Resource
    private ResumeService resumeService;
    @RequestMapping("showResume")
    public String showResume(Model model,HttpSession session)throws Exception{
        User user= (User) session.getAttribute("user");
        List<Resume> resumeList=resumeService.getAllResumeByUser(user);
        model.addAttribute("resumeList",resumeList);
        return "showResume";
    }
    @RequestMapping("updateResume")
    public String updateResume(Resume resume,Model model,HttpSession session)throws Exception{
        resumeService.updateResume(resume);
        return showResume(model,session);
    }
    @RequestMapping("deleteResume")
    public String deleteResume(Resume resume,Model model,HttpSession session)throws Exception{
        resumeService.deleteResume(resume);
        return showResume(model,session);
    }
    @RequestMapping("addResume")
    public String addResume(Resume resume,Model model,HttpSession session)throws Exception{
        User user= (User) session.getAttribute("user");
        resume.setUser(user);
        resumeService.addResume(resume);
        return showResume(model,session);
    }
    @RequestMapping("sendResume")
    public String sendResume(Resume resume,Model model,HttpSession session)throws Exception{
        Resume resume1=resumeService.getResumeByRs_id(resume);
        resume1.setRs_status(0);//设为管理员未读
        resumeService.updateResume(resume1);
        return showResume(model,session);
    }
    @RequestMapping("showUnReadResume")
    public String showUnReadResume(Model model)throws Exception{
        Resume resume=new Resume();
        resume.setRs_status(0);//未读
        List<Resume> resumeList=resumeService.getAllResumeByRs_status(resume);
        model.addAttribute("resumeList",resumeList);
        return "showUnReadResume";
    }

    @RequestMapping("markResume")
    public String markResume(Resume resume,Model model)throws Exception{
        resume.setRs_status(1);//标位已读
        resumeService.updateResume(resume);
        return showUnReadResume(model);
    }
    @RequestMapping("showReadedResume")
    public String showReadedResume(Model model)throws Exception{
        Resume resume=new Resume();
        resume.setRs_status(1);//未读
        List<Resume> resumeList=resumeService.getAllResumeByRs_status(resume);
        model.addAttribute("resumeList",resumeList);
        return "showReadedResume";
    }
}