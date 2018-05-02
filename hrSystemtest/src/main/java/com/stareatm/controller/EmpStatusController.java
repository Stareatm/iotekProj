package com.stareatm.controller;

import com.stareatm.model.Emp;
import com.stareatm.model.EmpStatus;
import com.stareatm.service.EmpService;
import com.stareatm.service.EmpStatusService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

/**
 * Created by 刘 on 2018/4/27.
 */
@Controller
@RequestMapping("empStatusController")
public class EmpStatusController {
    @Resource
    private EmpService empService;
    @Resource
    private EmpStatusService empStatusService;
    @Resource
    private EmpController empController;

    @RequestMapping("toRegular")
    public String toRegular(Emp emp, Model model)throws Exception{
        Emp emp1=empService.getEmp_JobByE_id(emp);
        model.addAttribute("emp",emp1);
        Date date=new Date();
        model.addAttribute("date",date);
        return "toRegular";
    }

    @RequestMapping("RegularEmp")
    public String RegularEmp(EmpStatus empStatus, String changeDate, Model model)throws Exception{
        Emp emp=new Emp(empStatus.getE_id());
        Emp emp1=empService.getEmp_JobByE_id(emp);
        emp1.setE_status(empStatus.getE_status());
        Date es_changeDate=new SimpleDateFormat("yyyy-MM-dd").parse(changeDate);

        Calendar changeDateCal=new GregorianCalendar();
        changeDateCal.setTime(es_changeDate);
        Calendar hireDateCal=new GregorianCalendar();
        hireDateCal.setTime(emp1.getE_hireDate());
        int diffDays= (int) ((es_changeDate.getTime()-emp1.getE_hireDate().getTime())/(1000*3600*24));//入职天数
        empStatus.setEs_changeDate(es_changeDate);
        if (diffDays>=60&&null!=empStatus.getEs_reasons()) {
            empService.updateEmp(emp1);//修改员工表
            empStatusService.addEmpStatus(empStatus);
            return empController.queryEmpInfo(emp1, model);
        }else{
            model.addAttribute("regularEmpError","入职时间不足二个月或转正理由为空!转正处理失败!");
            return "adminError";
        }
    }

    @RequestMapping("toLeave")
    public String toLeave(Emp emp, Model model)throws Exception{
        Emp emp1=empService.getEmp_JobByE_id(emp);
        model.addAttribute("emp",emp1);
        Date date=new Date();
        model.addAttribute("date",date);
        return "toLeave";
    }

    @RequestMapping("LeaveEmp")
    public String LeaveEmp(EmpStatus empStatus, String changeDate, Model model)throws Exception{
        Emp emp=new Emp(empStatus.getE_id());
        Emp emp1=empService.getEmp_JobByE_id(emp);
        emp1.setE_status(empStatus.getE_status());
        Date es_changeDate=new SimpleDateFormat("yyyy-MM-dd").parse(changeDate);

        Calendar changeDateCal=new GregorianCalendar();
        changeDateCal.setTime(es_changeDate);
        Calendar hireDateCal=new GregorianCalendar();
        hireDateCal.setTime(emp1.getE_hireDate());
        int diffDays= (int) ((es_changeDate.getTime()-emp1.getE_hireDate().getTime())/(1000*3600*24));//入职天数
        empStatus.setEs_changeDate(es_changeDate);
        if (diffDays>=60&&null!=empStatus.getEs_reasons()) {
            empService.updateEmp(emp1);//修改员工表
            empStatusService.addEmpStatus(empStatus);
            return empController.queryEmpInfo(emp1, model);
        }else{
            model.addAttribute("LeaveEmpError","离职时间或离职原因为空!处理失败!");
            return "adminError";
        }
    }

    @RequestMapping("showEmpStatus")
    public String showEmpStatus(Emp emp,Model model)throws Exception{
        Emp emp1=empService.getEmp_JobByE_id(emp);
        model.addAttribute("emp",emp1);

        EmpStatus empStatus=new EmpStatus();
        empStatus.setE_id(emp.getE_id());
        List<EmpStatus> empStatusList=empStatusService.getEmpStatusByE_id(empStatus);
        model.addAttribute("empStatusList",empStatusList);
        return "showEmpStatus";
    }
}
