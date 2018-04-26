package com.stareatm.controller;

import com.stareatm.model.Dept;
import com.stareatm.model.Job;
import com.stareatm.model.Recruit;
import com.stareatm.service.DeptService;
import com.stareatm.service.RecruitService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 刘 on 2018/4/21.
 */
@Controller
@RequestMapping("/recruitController")
public class RecruitController {
    @Resource
    private RecruitService recruitService;
    @Resource
    private DeptService deptService;
    @RequestMapping("showRecruit")
    public String showRecruit(Model model,HttpSession session) throws Exception{
        List<Recruit> recruitList=recruitService.getAllRecruit();
        model.addAttribute("recruitList",recruitList);

        List<Dept> deptList=deptService.getAllDept();
        model.addAttribute("deptList",deptList);
        List<Job> jobList=new ArrayList<>();
        if(deptList.size()!=0){
            Dept dept=deptService.getDept_JobByD_name(deptList.get(0));
            jobList=dept.getJobList();
        }
        model.addAttribute("jobList",jobList);

        ArrayList<String> locationList=new ArrayList<>();
        locationList.add("北京");
        locationList.add("上海");
        locationList.add("广州");
        locationList.add("深圳");
        locationList.add("杭州");
        locationList.add("武汉");
    /*    model.addAttribute("locationList",locationList);*/
        session.setAttribute("locationList",locationList);

        ArrayList<String> propertyList=new ArrayList<>();
        propertyList.add("国企");
        propertyList.add("外商独资");
        propertyList.add("代表处");
        propertyList.add("合资");
        propertyList.add("民营");
        propertyList.add("股份制企业");
        propertyList.add("上市公司");
        propertyList.add("国家机关");
        propertyList.add("事业单位");
        propertyList.add("银行");
        propertyList.add("医院");
        propertyList.add("学校/下级学院");
        propertyList.add("律师事务所");
        propertyList.add("社会团体");
        propertyList.add("港澳台公司");
        propertyList.add("其它");
    /*    model.addAttribute("propertyList",propertyList);*/
        session.setAttribute("propertyList",propertyList);

        ArrayList<String> eduBGList=new ArrayList<>();
        eduBGList.add("无学历要求");
        eduBGList.add("高中/中专/中技及以下");
        eduBGList.add("大专及同等学历");
        eduBGList.add("本科/学士及等同学历");
        eduBGList.add("硕士/研究生及等同学历");
        eduBGList.add("博士及以上");
        eduBGList.add("其他");
    /*    model.addAttribute("eduBGList",eduBGList);*/
        session.setAttribute("eduBGList",eduBGList);
        return "showRecruit";
    }
    @RequestMapping("showReceivedRecruit")
    public String showReceivedRecruit(Model model)throws Exception{
        Recruit recruit=new Recruit();
        recruit.setRc_status(1);//已发布的招聘信息
        List<Recruit> recruitList=recruitService.getAllRecruitByRc_status(recruit);
        model.addAttribute("recruitList",recruitList);
        return "showReceivedRecruit";
    }
    @RequestMapping("updateRecruit")
    public String updateRecruit(Recruit recruit,HttpSession session,Model model) throws Exception {
        recruitService.updateRecruit(recruit);
        return showRecruit(model,session);
    }

    @RequestMapping("deleteRecruit")
    public String deleteRecruit(Recruit recruit,Model model,HttpSession session) throws Exception {
        recruitService.deleteRecruit(recruit);
        return showRecruit(model,session);
    }

    @RequestMapping("toPage")
    public String toPage(String choose,Model model) throws Exception {
        System.out.println(choose);
        if("addRecruit".equals(choose)){
            List<Dept> deptList=deptService.getAllDept();
            model.addAttribute("deptList",deptList);
            List<Job> jobList=new ArrayList<>();
            if(deptList.size()!=0){
                Dept dept=deptService.getDept_JobByD_name(deptList.get(0));
                jobList=dept.getJobList();
            }
            model.addAttribute("jobList",jobList);
            return "addRecruit";
        }else if ("adminMain".equals(choose)){
            return "adminMain";
        }else if ("empMain".equals(choose)){
            return "empMain";
        } else if ("addResume".equals(choose)){
            return "addResume";
        }
        return "userMain";
    }

    @RequestMapping("addRecruit")
    public String addRecruit(Recruit recruit,Model model,HttpSession session) throws Exception {
        recruitService.addRecruit(recruit);
        return showRecruit(model,session);
    }
    @RequestMapping("toAdminMain")
    public String toAdminMain()throws Exception{
        return "adminMain";
    }
}
