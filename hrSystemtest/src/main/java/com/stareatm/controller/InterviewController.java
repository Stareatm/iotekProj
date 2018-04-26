package com.stareatm.controller;

import com.stareatm.model.*;
import com.stareatm.service.DeptService;
import com.stareatm.service.InterviewService;
import com.stareatm.service.JobService;
import com.stareatm.service.ResumeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 刘 on 2018/4/23.
 */
@Controller
@RequestMapping("/interviewController")
public class InterviewController {
    @Resource
    private InterviewService interviewService;
    @Resource
    private JobService jobService;
    @Resource
    private ResumeService resumeService;
    @Resource
    private DeptService deptService;
    @RequestMapping("toAddInterview")
    public String toAddInterview(Resume resume, Model model)throws Exception{
        Resume resume1=resumeService.getResumeByRs_id(resume);//查出简历及用户信息
        model.addAttribute("resume",resume1);

        List<Dept> deptList=deptService.getAllDept();
        model.addAttribute("deptList",deptList);
        List<Job> jobList=new ArrayList<>();
        if(deptList.size()!=0){
            Dept dept=deptService.getDept_JobByD_name(deptList.get(0));
            jobList=dept.getJobList();
        }
        model.addAttribute("jobList",jobList);
        return "addInterview";
    }
    @RequestMapping("addInterview")
    public String addInterview(Resume resume,String iTime,Interview interview)throws Exception{
        Resume resume1=resumeService.getResumeByRs_id(resume);//查出简历及用户信息
        interview.setResume(resume);//简历
        String time=iTime.substring(0,10)+" "+iTime.substring(11,16);
        System.out.println(time);
        interview.setI_time(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(time));//面试时间
        interview.setI_status(0);
        interviewService.addInterview(interview);//发送面试成功
        return "adminMain";
    }
    @RequestMapping("toPage")
    public String toPage(String choose)throws Exception{
        if("adminMain".equals(choose)) {
            return "adminMain";
        }
        return "userMain";
    }

    @RequestMapping("showReceivedInterview")
    public String showReceivedInterview(HttpSession session,Model model)throws Exception{
        Interview interview=new Interview();
        interview.setI_status(0);//已接收的面试邀请
        List<Interview> interviewList=interviewService.getInterview_RsByI_status(interview);//全部用户接收的面试邀请
        List<Interview> interviewList1=new ArrayList<>();//存本游客的面试邀请
        User user= (User) session.getAttribute("user");
        for (int i=0;i<interviewList.size();i++){
            Resume resume=interviewList.get(i).getResume();//
            Resume resume1=resumeService.getResumeByRs_id(resume);//查到resume_user
            if (user.equals(resume1.getUser())){//面试邀请中简历对应的用户就是本用户
                interviewList1.add(interviewList.get(i));
            }
        }
        model.addAttribute("interviewList",interviewList1);
        return "showReceivedInterview";
    }
    @RequestMapping("confirmInterview")
    public String confirmInterview(Interview interview)throws Exception{
        interview.setI_status(1);//确认面试
        interviewService.updateInterview(interview);
        return "userMain";
    }

    @RequestMapping("showSentInterview")
    public String showSentInterview(Model model)throws Exception{
        Interview interview=new Interview();
        interview.setI_status(0);//已发送未确认的面试
        List<Interview> interviewList=interviewService.getInterview_RsByI_status(interview);
        model.addAttribute("interviewList",interviewList);
        return "showSentInterview";
    }
    @RequestMapping("showConfirmedInterview")
    public String showConfirmedInterview(Model model)throws Exception{
        Interview interview=new Interview();
        interview.setI_status(1);//确认的面试
        List<Interview> interviewList=interviewService.getInterview_RsByI_status(interview);
        model.addAttribute("interviewList",interviewList);
        return "showConfirmedInterview";
    }
}
