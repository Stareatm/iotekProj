package com.stareatm.controller;

import com.stareatm.model.Interview;
import com.stareatm.model.Resume;
import com.stareatm.model.User;
import com.stareatm.service.InterviewService;
import com.stareatm.service.ResumeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by 刘 on 2018/4/22.
 */
@Controller
@RequestMapping("/resumeController")
public class ResumeController {
    @Resource
    private ResumeService resumeService;
    @Resource
    private InterviewService interviewService;
    @RequestMapping("showResume")
    public String showResume(Model model,HttpSession session)throws Exception{
        User user= (User) session.getAttribute("user");
        List<Resume> resumeList=resumeService.getAllResumeByUser(user);
        model.addAttribute("resumeList",resumeList);
        return "showResume";
    }
    @RequestMapping("updateResume")
    public String updateResume(Resume resume,Model model,String birthday,HttpSession session)throws Exception{
        resume.setRs_birthday(new SimpleDateFormat("yyyy-MM-dd").parse(birthday));
        resumeService.updateResume(resume);
        return showResume(model,session);
    }
    @RequestMapping("deleteResume")
    public String deleteResume(Resume resume,Model model,HttpSession session)throws Exception{
        resumeService.deleteResume(resume);
        return showResume(model,session);
    }

    @RequestMapping("phoneAJAX")
    public void phoneAJAX(String phone, HttpSession session, HttpServletResponse response)throws Exception{
        response.setContentType("text/html;charset=utf-8");
        User user= (User) session.getAttribute("user");
        Resume resume=new Resume();
        resume.setRs_phone(phone);
        List<Resume> resumeList=resumeService.getAllResumeByPhone(resume);
        String message=null;
        if (resumeList.size()!=0&&!resumeList.get(0).getUser().equals(user)){
            message="×此手机号在本网站已经登记,不可登记于该简历!";
        }else {
            message = "√,此号码未被使用!";
        }
        response.getWriter().print(message);
    }

    @RequestMapping("addResume")
    public String addResume(Resume resume, Model model, String birthday, HttpSession session)throws Exception{
        User user= (User) session.getAttribute("user");
        resume.setUser(user);
        resume.setRs_birthday(new SimpleDateFormat("yyyy-MM-dd").parse(birthday));
        List<Resume> resumeList=resumeService.getAllResumeByPhone(resume);
        if (resumeList.size()!=0&&!resumeList.get(0).getUser().equals(user)){
            model.addAttribute("phoneError","此手机号在本网站已被其他用户登记,不可登记于该简历!") ;
            return "addResume";
        }
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
        Resume resume1=resumeService.getResumeByRs_id(resume);
        resume1.setRs_status(1);//标位已读
        resumeService.updateResume(resume1);
        return showUnReadResume(model);
    }
    @RequestMapping("showReadedResume")
    public String showReadedResume(Model model)throws Exception{
        Resume resume=new Resume();
        resume.setRs_status(1);//已读
        List<Resume> resumeList=resumeService.getAllResumeByRs_status(resume);//查询已读简历
        for(int i=0;i<resumeList.size();i++){
            Resume resume1=resumeService.getResume_Interview(resumeList.get(i));//查询是否有对应的邀请
            if(null!=resume1){
                resumeList.get(i).setInterview(resume1.getInterview());//将查询邀请结果添加上去
            }else {
                resumeList.get(i).setInterview(null);
            }
        }
        model.addAttribute("resumeList",resumeList);
        return "showReadedResume";
    }

}
