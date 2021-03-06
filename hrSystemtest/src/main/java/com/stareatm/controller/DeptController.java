package com.stareatm.controller;

import com.stareatm.model.Dept;
import com.stareatm.model.Emp;
import com.stareatm.model.Job;
import com.stareatm.service.DeptService;
import com.stareatm.service.EmpService;
import com.stareatm.service.JobService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 刘 on 2018/4/24.
 */
@Controller
@RequestMapping("/deptController")
public class DeptController {
    @Resource
    private DeptService deptService;
    @Resource
    private JobService jobService;
    @Resource
    private EmpService empService;
    @RequestMapping("toPage")
    public String toPage(String choose)throws Exception{
        if ("addDept".equals(choose)){
            return "addDept";
        }
        return "adminMain";
    }

    @RequestMapping("showDept")
    public String showDept(Model model)throws Exception{
        List<Dept> deptList=deptService.getAllDept();
        for (int i=0;i<deptList.size();i++){
            Dept dept=deptService.getDept_JobByD_name(deptList.get(i));//dept_job
            if (null!=dept){//部门有职位
                List<Job> jobList=dept.getJobList();//当前部门对应的职位
                for (int j=0;j<jobList.size();j++){
                    Job job=jobService.getJob_EmpByJ_id(jobList.get(j));//添加员工信息
                    if(null!=job){//职位有员工
                        jobList.get(j).setEmpList(job.getEmpList());
                    }//else{empList=null}
                }
                deptList.get(i).setJobList(jobList);//添加job
            }else{
                List<Job> jobList=new ArrayList<>();
                deptList.get(i).setJobList(jobList);//空部门
            }
        }
        model.addAttribute("deptList",deptList);
        return "showDept";
    }
    @RequestMapping("queryDept")
    public String queryDept(Model model)throws Exception{
        List<Dept> deptList=deptService.getAllDept();
        model.addAttribute("deptList",deptList);
        List<Job> jobList=new ArrayList<>();
        if(deptList.size()!=0){
            Dept dept=deptService.getDept_JobByD_name(deptList.get(0));
            jobList=dept.getJobList();
        }
        model.addAttribute("jobList",jobList);
        return "queryDept";
    }
    @RequestMapping("addDept")
    public String addDept(Dept dept,Model model)throws Exception{
        Dept dept1=deptService.getDeptByD_name(dept);
        if (null==dept1){
            deptService.addDept(dept);
            return showDept(model);
        }
        model.addAttribute("addDeptError","部门名重复,部门添加失败!");
        return "adminError";
    }

    @RequestMapping("ajaxFindDept")
    @ResponseBody
    public Dept ajaxFindDept(Dept dept)throws Exception{
        return deptService.getDeptByD_name(dept);
    }

    @RequestMapping("deleteDept")
    public String deleteDept(Dept dept,Model model)throws Exception{
        deptService.deleteDeptByD_name(dept);
        return showDept(model);
    }
}
