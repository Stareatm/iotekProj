package com.stareatm.controller;

import com.stareatm.model.Dept;
import com.stareatm.model.Job;
import com.stareatm.service.DeptService;
import com.stareatm.service.JobService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by 刘 on 2018/4/26.
 */
@Controller
@RequestMapping("/jobController")
public class JobController {
    @Resource
    private JobService jobService;
    @Resource
    private DeptService deptService;
    @Resource
    private DeptController deptController;
    @RequestMapping("addJob")
    public String addJob(String d_name,String j_name,Model model){
        Job job1=jobService.getJobByJ_nameD_name(j_name,d_name);//得到j_id
        if(null!=d_name&&null!=j_name&&null==job1){
            Dept dept=new Dept();
            dept.setD_name(d_name);
            Dept dept1=deptService.getDeptByD_name(dept);//部门

            Job job=new Job();
            job.setDept(dept1);
            job.setJ_name(j_name);//j_name
            jobService.addJobByJ_name(job);
            try {
                return deptController.showDept(model);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "addJobFailed";
    }

}
