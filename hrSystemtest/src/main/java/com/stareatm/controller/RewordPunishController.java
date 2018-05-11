package com.stareatm.controller;

import com.stareatm.model.Emp;
import com.stareatm.model.RewordPunish;
import com.stareatm.model.Salary;
import com.stareatm.service.EmpService;
import com.stareatm.service.RewordPunishService;
import com.stareatm.service.SalaryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by 刘 on 2018/5/5.
 */
@Controller
@RequestMapping("rewordPunishController")
public class RewordPunishController {
    @Resource
    private RewordPunishService rewordPunishService;
    @Resource
    private EmpService empService;
    @Resource
    private SalaryService salaryService;
    @Resource
    private SalaryController salaryController;
    @RequestMapping("queryRP")
    public String queryRP(Emp emp, Model model)throws Exception{
        model.addAttribute("emp",emp);
        RewordPunish rewordPunish=new RewordPunish();
        rewordPunish.setEmp(emp);
        List<RewordPunish> rewordPunishList=rewordPunishService.getAllRewordPunishByE_id(rewordPunish);
        model.addAttribute("rewordPunishList",rewordPunishList);
        return "queryRP";
    }

    @RequestMapping("updateRP")
    public String updateRP(RewordPunish rewordPunish,Emp emp,String rpTime,Model model)throws Exception{
        /*String time=rpTime.substring(0,10)+" "+rpTime.substring(11,16);*/
        rewordPunish.setRp_time(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rpTime));
        rewordPunishService.updateRP(rewordPunish);
        Emp emp1=empService.getEmp_JobByE_id(emp);
        return queryRP(emp,model);
    }

    @RequestMapping("deleteRP")
    public String deleteRP(RewordPunish rewordPunish,Model model)throws Exception{
        RewordPunish rp=rewordPunishService.geRewordPunishByRp_id(rewordPunish);
        rewordPunishService.deleteRP(rewordPunish);
        return queryRP(rp.getEmp(),model);
    }

    @RequestMapping("addRP")
    public String addRP(RewordPunish rewordPunish,String rpTime,Emp emp,Model model)throws Exception{
        String time=rpTime.substring(0,10)+" "+rpTime.substring(11,16);
        rewordPunish.setRp_time(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(time));
        rewordPunish.setEmp(emp);
        rewordPunishService.addRP(rewordPunish);
        return queryRP(emp,model);
    }

    @RequestMapping("addRP1")
    public String addRP1(RewordPunish rewordPunish, String rpTime, Salary salary,Model model)throws Exception{
        System.out.println(">>>>3333>>sal="+salary);
        Salary salary1=salaryService.getSalaryByS_id(salary);//薪资
        String time=rpTime.substring(0,10)+" "+rpTime.substring(11,16);
        rewordPunish.setRp_time(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(time));
        rewordPunish.setEmp(salary1.getEmp());
        rewordPunishService.addRP(rewordPunish);//添加奖惩
        salary1.setS_status(3);
        salaryService.updateSalary(salary1);
        return salaryController.querySalaryReconsider(model);
    }

    @RequestMapping("showRP")
    public String showRP(HttpSession session,Model model)throws Exception{
        Emp emp= (Emp) session.getAttribute("emp");
        RewordPunish rewordPunish=new RewordPunish();
        rewordPunish.setEmp(emp);
        List<RewordPunish> rewordPunishList=rewordPunishService.getAllRewordPunishByE_id(rewordPunish);
        model.addAttribute("rewordPunishList",rewordPunishList);
        return "showRP";
    }
}
