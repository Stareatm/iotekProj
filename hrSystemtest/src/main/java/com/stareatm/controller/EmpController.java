package com.stareatm.controller;

import com.stareatm.model.*;
import com.stareatm.service.*;
import jdk.nashorn.internal.scripts.JO;
import org.junit.experimental.theories.FromDataPoints;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.EnumMap;
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
    @Resource
    private AttendanceService attendanceService;
    @Resource
    private RewordPunishService rewordPunishService;

    @RequestMapping("toAddEmp")
    public String toAddEmp(Interview interview,Model model)throws Exception{
        Interview interview1=interviewService.getInterview_Rs(interview);
        model.addAttribute("interview",interview1);
        Resume resume=interview1.getResume();
        model.addAttribute("resume",resume);
        return "addEmp";
    }

    @RequestMapping("addEmp")
    public String addEmp(Emp emp,String d_name,String j_name,String eBirthday,String hireDate,Interview interview)throws Exception{
        Date e_birthday=new SimpleDateFormat("yyyy-MM-dd").parse(eBirthday);
        Date e_hireDate=new SimpleDateFormat("yyyy-MM-dd").parse(hireDate);
        Job job1=jobService.getJobByJ_nameD_name(j_name,d_name);//得到j_id
        emp.setE_birthday(e_birthday);
        emp.setE_hireDate(e_hireDate);
        emp.setJob(job1);
        emp.setE_account(emp.getE_phone());
        emp.setE_pass("a123456");
        empService.addEmp(emp);
        Interview interview1=interviewService.getInterview_Rs(interview);
        interview1.setI_status(2);
        interviewService.updateInterview(interview1);
        return "adminMain";
    }

    @RequestMapping("findJob")
    @ResponseBody
    public List<Job> findJob(String d_name)throws Exception{
        Dept dept=new Dept();
        dept.setD_name(d_name);
        Dept dept1=deptService.getDept_JobByD_name(dept);
        List<Job> jobList=new ArrayList<>();
        if (null!=dept1) {
            return dept1.getJobList();
        }
        return jobList;
    }
    @RequestMapping("showEmpAJAX")
    @ResponseBody
    public List<Emp> showEmpAJAX(String d_name,String j_name){
        System.out.println(">>>>d_name="+d_name);
        System.out.println(">>>>j_name="+j_name);
        Job job=jobService.getJobByJ_nameD_name(j_name,d_name);
        List<Emp> empList=new ArrayList<>();
        if (null!=job){//有该职位
            Job job1=jobService.getJob_EmpByJ_id(job);
            if(null!=job1){//用户存在
                empList=job1.getEmpList();//可能为null
                System.out.println(">>>>>empList="+empList);
            }
        }
        return empList;
    }

    @RequestMapping("toPage")
    public String toPage(String choose) throws Exception{
        if ("updateEmpPass".equals(choose)){
            return "updateEmpPass";
        }else if("adminMain".equals(choose)){
            return "adminMain";
        }
        return "empMain";
    }
    @RequestMapping("updateEmpPass")
    public String updateEmpPass(String e_pass1,Emp emp,Model model)throws Exception{
        if (e_pass1.equals(emp.getE_pass())){
            Emp emp1=empService.getEmpByE_account(emp);
            System.out.println(emp1);
            emp1.setE_pass(e_pass1);
            empService.updateEmpPassByAccount(emp1);
            return "login";
        }else {
            model.addAttribute("rePassError","×两次密码不一致!");
            return "updateEmpPass";
        }
    }
    @RequestMapping("empLogin")
    public String empLogin(Emp emp,HttpSession session,Model model) throws Exception{
        Emp emp1=empService.login(emp);
        if(null!=emp1){
            if (emp1.getE_status()!=2) {
                //登录成功
                session.setAttribute("emp", emp1);
                return "empMain";
            }//离职员工
            model.addAttribute("empLoginError","×员工已离职,登录失败!");
            return "login";
        }
        model.addAttribute("empLoginError","×账号或密码错误,员工登录失败!");
        return "login";
    }

    @RequestMapping("showEmpInfo")
    public String showEmpInfo(HttpSession session,Model model)throws Exception{
        Emp emp= (Emp) session.getAttribute("emp");
        Job job=jobService.getJobByJ_id(emp.getJob());
        model.addAttribute(job);
        return "showEmpInfo";
    }

    @RequestMapping("updateEmpInfo")
    public String updateEmpInfo(HttpSession session,Emp emp,String eBirthday,Model model)throws Exception{
        Emp emp1= (Emp) session.getAttribute("emp");
        Date e_birthday=new SimpleDateFormat("yyyy-MM-dd").parse(eBirthday);
        emp.setE_birthday(e_birthday);
        emp.setE_hireDate(emp1.getE_hireDate());
        emp.setE_account(emp1.getE_account());
        emp.setE_pass(emp1.getE_pass());
        emp.setJob(emp1.getJob());
        empService.updateEmp(emp);
        return showEmpInfo(session,model);
    }
    @RequestMapping("queryEmpInfo")
    public String queryEmpInfo(Emp emp,Model model)throws Exception{
        Emp emp1=empService.getEmp_JobByE_id(emp);
        Job job1=jobService.getJobByJ_id(emp1.getJob());
        emp1.setJob(job1);
        model.addAttribute("emp",emp1);//得到的是emp_job_dept
        List<Dept> deptList=deptService.getAllDept();
        model.addAttribute("deptList",deptList);

        List<Job> jobList=jobService.getJobByD_id(job1);
        model.addAttribute("jobList",jobList);//emp部门对应的job
        return "queryEmpInfo";
    }

    @RequestMapping("changeEmpJob")
    public String changeEmpJob(Emp emp,String j_name,String d_name,Model model)throws Exception{
        Emp emp1=empService.getEmp_JobByE_id(emp);//获得emp
        Job job=jobService.getJobByJ_nameD_name(j_name,d_name);
        emp1.setJob(job);//改j_id
        empService.updateEmp(emp1);
        return queryEmpInfo(emp1,model);
    }

    @RequestMapping("queryEmpBaseInfo")
    public String queryEmpBaseInfo(Emp emp,Model model)throws Exception{
        Emp emp1=empService.getEmp_JobByE_id(emp);
        model.addAttribute("emp",emp);
        Job job=jobService.getJobByJ_id(emp1.getJob());
        model.addAttribute(job);
        return "queryEmpBaseInfo";
    }

}
