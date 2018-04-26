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
        Interview interview1=interviewService.getInterview_Rs(interview);
        model.addAttribute("interview",interview1);
        Resume resume=interview1.getResume();
        model.addAttribute("resume",resume);
        return "addEmp";
    }

    @RequestMapping("addEmp")
    public String addEmp(Emp emp,String d_name,String j_name,String eBirthday,String hireDate)throws Exception{
        Date e_birthday=new SimpleDateFormat("yyyy-MM-dd").parse(eBirthday);
        Date e_hireDate=new SimpleDateFormat("yyyy-MM-dd").parse(hireDate);
        Job job1=jobService.getJobByJ_nameD_name(j_name,d_name);//得到j_id
        emp.setE_birthday(e_birthday);
        emp.setE_hireDate(e_hireDate);
        emp.setJob(job1);
        emp.setE_account(emp.getE_phone());
        emp.setE_pass("123456");
        empService.addEmp(emp);
        return "adminMain";
    }

    @RequestMapping("findJob")
    @ResponseBody
    public List<Job> findJob(String d_name)throws Exception{
        Dept dept=new Dept();
        dept.setD_name(d_name);
        Dept dept1=deptService.getDept_JobByD_name(dept);
        return dept1.getJobList();

    }

    @RequestMapping("toPage")
    public String toPage(String choose) throws Exception{
        if ("updateEmpPass".equals(choose)){
            return "updateEmpPass";
        }
        return "empMain";
    }
    @RequestMapping("updateEmpPass")
    public String updateEmpPass(String e_pass1,Emp emp)throws Exception{
        if (e_pass1.equals(emp.getE_pass())){
            Emp emp1=empService.getEmpByE_account(emp);
            System.out.println(emp1);
            emp1.setE_pass(e_pass1);
            empService.updateEmpPassByAccount(emp1);
            return "login";
        }else {
            return "updatePassFailed";
        }
    }
    @RequestMapping("empLogin")
    public String empLogin(Emp emp,HttpSession session) throws Exception{
        Emp emp1=empService.login(emp);
        if(null!=emp1){
            session.setAttribute("emp",emp1);
            return "empMain";
        }
        return "loginFailed";
    }
    @RequestMapping("showEmpInfo")
    public String showEmpInfo(HttpSession session,Model model)throws Exception{
        Emp emp= (Emp) session.getAttribute("emp");
        Job job=jobService.getJobByJ_id(emp.getJob());
        model.addAttribute(job);
        return "showEmpInfo";
    }
}
