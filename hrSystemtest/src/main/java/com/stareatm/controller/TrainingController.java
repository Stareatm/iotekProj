package com.stareatm.controller;

import com.stareatm.model.Dept;
import com.stareatm.model.Job;
import com.stareatm.model.Training;
import com.stareatm.service.DeptService;
import com.stareatm.service.JobService;
import com.stareatm.service.TrainingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 刘 on 2018/5/1.
 */
@Controller
@RequestMapping("/trainingController")
public class TrainingController {
    @Resource
    private TrainingService trainingService;
    @Resource
    private DeptService deptService;
    @Resource
    private JobService jobService;

    @RequestMapping("showTraining")
    public String showTraining(Model model)throws Exception{
        List<Training> trainingList=trainingService.getAllTraining();
        for (int i=0;i<trainingList.size();i++){
            Dept dept=trainingList.get(i).getDept();
            Dept dept1=deptService.getDeptByD_id(dept);//找到部门
            Dept dept2=deptService.getDept_JobByD_name(dept);//找到职位
            if(null!=dept2){
                List<Job> jobList=dept2.getJobList();
                for (int j=0;j<jobList.size();j++){
                    Job job=jobService.getJob_EmpByJ_id(jobList.get(j));
                    if (null!=job){//有员工
                        jobList.get(j).setEmpList(job.getEmpList());
                    }
                }
                dept2.setJobList(jobList);
                trainingList.get(i).setDept(dept2);
            }else{
                List<Job> jobList=new ArrayList<>();
                trainingList.get(i).setDept(dept1);
                trainingList.get(i).getDept().setJobList(jobList);
            }
        }
        model.addAttribute("trainingList",trainingList);
        List<Dept> deptList=deptService.getAllDept();
        model.addAttribute("deptList",deptList);
        return "showTraining";
    }

    @RequestMapping("addTraining")
    public String addTraining(Dept dept,Training training,String beginTime,String endTime,Model model)throws Exception{
        String beginTime1=beginTime.substring(0,10)+" "+beginTime.substring(11,16);
        Date t_beginTime=new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(beginTime1);
        training.setT_beginTime(t_beginTime);
        String endtTime1=endTime.substring(0,10)+" "+endTime.substring(11,16);
        Date t_endTime=new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(endtTime1);
        training.setT_endTime(t_endTime);
        Dept dept1=deptService.getDeptByD_name(dept);
        training.setDept(dept1);
        if (endTime.compareTo(beginTime)>0){
            trainingService.addTraining(training);
            return showTraining(model);
        }
        model.addAttribute("addTrainingError","您输入的培训结束时间不晚于培训开始时间,添加失败!");
        return "adminError";
    }

    @RequestMapping("updateTraining")
    public String updateTraining(Training training,Dept dept,String beginTime,String endTime,Model model)throws Exception{
        Date t_beginTime=new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(beginTime);
        training.setT_beginTime(t_beginTime);
        Date t_endTime=new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(endTime);
        training.setT_endTime(t_endTime);
        Dept dept1=deptService.getDeptByD_name(dept);
        training.setDept(dept1);
        if (endTime.compareTo(beginTime)>0){
            trainingService.updateTraining(training);
            return showTraining(model);
        }
        model.addAttribute("updateTrainingError","您输入的培训结束时间不晚于培训开始时间,修改失败!");
        return "adminError";
    }

    @RequestMapping("deleteTraining")
    public String deleteTraining(Training training,Model model)throws Exception{
        trainingService.deleteTraining(training);
        return showTraining(model);
    }

    @RequestMapping("checkEndTime")
    public void checkEndTime(String beginTime, String endTime,HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/java;charset=utf-8");
        String message=endTime.compareTo(beginTime)>0 ? "√":"结束时间需晚于开始时间";
        response.getWriter().print(message);
    }
}
