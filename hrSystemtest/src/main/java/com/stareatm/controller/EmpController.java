package com.stareatm.controller;

import com.stareatm.model.*;
import com.stareatm.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by 刘 on 2018/4/23.
 */
@Controller
@RequestMapping("/empController")
public class EmpController {
    @Resource
    private InterviewService interviewService;
    @Resource
    private DeptService deptService;
    @Resource
    private JobService jobService;
    @Resource
    private EmpService empService;
    @Resource
    private UserService userService;
    @RequestMapping("toAddEmp")
    public String toAddEmp(Interview interview,Model model)throws Exception{
        Interview interview1=interviewService.getInterview_Rs_Job(interview);
        Resume resume=interview1.getResume();
        model.addAttribute("resume",resume);
        List<Dept> deptList=deptService.getAllDept();
        model.addAttribute("deptList",deptList);
        List<Job> jobList=deptList.get(0).getJobList();
        model.addAttribute("jobList",jobList);
        return "addEmp";
    }

    @RequestMapping("addEmp")
    public String addEmp(Emp emp,Job job,Dept dept,String e_hireDate)throws Exception{
        Date hireDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(e_hireDate);
        Job job1=jobService.getJobByJ_nameD_name(job,dept);//得到j_id
        emp.setE_hireDate(hireDate);
        emp.setJob(job1);
        empService.addEmp(emp);
        User user=new User();
        user.setU_name(emp.getE_phone());
        user.setU_pass("123456");
        user.setU_type(1);
        userService.addUser(user);
        return "adminMain";
    }

    @RequestMapping("findJob")
    @ResponseBody
    public List<Job> findJob(Dept dept)throws Exception{
        Dept dept1=deptService.getDept_JobByD_name(dept);
        List<Job> jobList=dept1.getJobList();
        return jobList;
    }

    @RequestMapping("toPage")
    public String toPage(String choose) throws Exception{
        if ("updatePass".equals(choose)){
            return "updatePass";
        }
        return "empMain";
    }
    @RequestMapping("updatePass")
    public String updatePass(String u_pass1,User user)throws Exception{
        if (u_pass1.equals(user.getU_pass())){
            userService.updateUserPassByName(user);
            return "login";
        }else {
            return "updateFailed";
        }
    }
}
