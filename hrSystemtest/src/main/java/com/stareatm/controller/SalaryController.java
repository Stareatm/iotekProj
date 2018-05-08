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
import java.util.*;

/**
 * Created by 刘 on 2018/5/2.
 */
@Controller
@RequestMapping("/salaryController")
public class SalaryController {
    @Resource
    private SalaryService salaryService;
    @Resource
    private EmpService empService;
    @Resource
    private AttendanceService attendanceService;
    @Resource
    private RewordPunishService rewordPunishService;
    @Resource
    private EmpStatusService empStatusService;
    @RequestMapping("showSalary")
    public String showSalary(HttpSession session, Model model)throws Exception{
        Emp emp= (Emp) session.getAttribute("emp");
        Salary salary=new Salary();
        salary.setEmp(emp);
        List<Salary> salaryList=salaryService.getSalaryByE_id(salary);
  /*      Calendar calendar=Calendar.getInstance();
        calendar.setTime(new Date());
        int year=calendar.get(Calendar.YEAR);//当前年份
        int month=calendar.get(Calendar.MONTH);//当前月份
        int day=calendar.get(Calendar.DAY_OF_MONTH);//当前某日
        if (month==0){
            for(int i=0;i<salaryList.size();i++){
                Date s_time=salaryList.get(i).getS_time();
                Calendar calendar1=Calendar.getInstance();
                calendar1.setTime(s_time);
                int s_year=calendar1.get(Calendar.YEAR);
                int s_month=calendar1.get(Calendar.MONTH);
                Date date=new Date();
                date.setYear(year-1);
                date.setMonth(11);//12月
            }
        }*/
        model.addAttribute("salaryList",salaryList);
        return "showSalary";
    }

    @RequestMapping("addSalaryReconsider")
    public String addSalaryReconsider(Salary salary,HttpSession session,Model model)throws Exception{
        Salary salary1=salaryService.getSalaryByS_id(salary);
        salary1.setS_status(1);//申请复议
        salaryService.updateSalary(salary1);
        return showSalary(session,model);
    }
    @RequestMapping("showAllSalary")
    public String showAllSalary(Model model)throws Exception{
        Date date=new Date();
        int currentYear=Integer.parseInt(new SimpleDateFormat("yyyy").format(date));//当前年份
        int currentMonth=Integer.parseInt(new SimpleDateFormat("MM").format(date));//当前月份
      /*  List<Emp> empList=empService.getAllEmp();
        Emp emp=empList.get(0);*/
        Emp emp=empService.getFirstHiredEmp();
        List<Integer> yearList=new ArrayList<>();
        List<Integer> monthList=new ArrayList<>();
        int year=Integer.parseInt(new SimpleDateFormat("yyyy").format(emp.getE_hireDate()));
        int month=Integer.parseInt(new SimpleDateFormat("MM").format(emp.getE_hireDate()));
        for (int i=year;i<=currentYear;i++){
            yearList.add(i);
        }

        if (year==currentYear){//今年之前没有员工入职,今年可查看的工资发放月份: month-currentMonth
            for (int i=month;i<=currentMonth-1;i++){//当前月份不会发当前月的工资
                monthList.add(i);
            }
        }else {//今年之前如果有员工入职,今年可查看的工资发放月份: 1-currentMonth
            for (int i = 1; i <= currentMonth - 1; i++) {//当前月份不会发当前月的工资
                monthList.add(i);
            }
        }

        model.addAttribute("currentYear",currentYear);//当前年份
        model.addAttribute("currentMonth",currentMonth);//当前月份
        model.addAttribute("year",year);//最早入职年份
        model.addAttribute("month",month);//最早入职月份
        model.addAttribute("yearList",yearList);
        model.addAttribute("monthList",monthList);
        return "showAllSalary";
    }

    @RequestMapping("paySalary")
    public String paySalary(String selectedYear, String selectedMonth, Model model)throws Exception{
        List<Emp> empList=empService.getAllEmp();
        int count=0;
        for (Emp emp:empList){//对每个员工遍历
            String selectedStr=null;
            if (Integer.parseInt(selectedMonth)<10){
                selectedStr=selectedYear+"-0"+selectedMonth;
            }else {
                selectedStr=selectedYear+"-"+selectedMonth;
            }
            String hireStr=new SimpleDateFormat("yyyy-MM").format(emp.getE_hireDate());//入职时间
            EmpStatus empStatus=new EmpStatus();
            empStatus.setE_id(emp.getE_id());
            empStatus.setE_status(2);//离职的状态信息
            EmpStatus empStatus1=empStatusService.getEmpStatusByE_idE_status(empStatus);
            String changeStr=null;
            if (null!=empStatus1){
                changeStr=new SimpleDateFormat("yyyy-MM").format(empStatus1.getEs_changeDate());//离职时间
            }
            if (hireStr.compareTo(selectedStr)<=0) {// 入职日期在selectedStr之前的员工,可以发薪
                if(null==changeStr||changeStr.compareTo(selectedStr)>=0) {//未离职,或者离职日期在目标月份之后
                    count++;//发薪个数+1;
                    Salary salary = new Salary();
                    int s_baseSal = emp.getE_baseSal();//基本
                    int s_performance = s_baseSal / 10;//绩效
                    int s_socialSecurity = (int) (s_baseSal * 0.105);//社保,正数
                    int s_rpSal = 0;
                    int s_totalSal;
                    Date s_time = new Date();//当前日期
                    salary.setEmp(emp);
                    salary.setS_baseSal(s_baseSal);
                    salary.setS_performance(s_performance);
                    salary.setS_socialSecurity(s_socialSecurity);
                    salary.setS_time(s_time);
                    salary.setS_status(0);

                    //查询打了目标月份.上下班卡的考勤
                    Attendance attendance = new Attendance();
                    attendance.setEmp(emp);
                    List<Attendance> attendanceList1 = attendanceService.getAttendanceByE_idAt_endTime(attendance);
                    List<Attendance> attendanceList = new ArrayList<>();
                    for (Attendance att : attendanceList1) {
                        if (selectedStr.equals(new SimpleDateFormat("yyyy-MM").format(att.getAt_startTime()))) {
                            attendanceList.add(att);
                        }
                    }
                    //查询打了目标月份的奖惩记录
                    RewordPunish rewordPunish1 = new RewordPunish();
                    rewordPunish1.setEmp(emp);
                    List<RewordPunish> allRewordPunishList = rewordPunishService.getAllRewordPunishByE_id(rewordPunish1);
                    List<RewordPunish> rewordPunishList = new ArrayList<>();//目标日期奖惩集合
                    for (RewordPunish rp : allRewordPunishList) {
                        if (selectedStr.equals(new SimpleDateFormat("yyyy-MM").format(rp.getRp_time()))) {
                            rewordPunishList.add(rp);
                        }
                    }

                    if (attendanceList.size() < 22) {//非旷工少于22天,添加奖惩
                        RewordPunish rewordPunish = new RewordPunish();
                        String currentStr = new SimpleDateFormat("yyyy-MM").format(s_time);
                        //当月1号00:00:01添加奖惩
                        Date rp_time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(selectedStr + "-01 00:00:01");
                        rewordPunish.setRp_time(rp_time);
                        int p_days = 22 - attendanceList.size();//旷工数天
                        int rp_rpSal = -p_days * s_baseSal / 30;//旷工工资金额,正数
                        rewordPunish.setRp_rpSal(rp_rpSal);
                        rewordPunish.setEmp(emp);
                        rewordPunish.setRp_reason("旷工" + p_days + "天,扣除金额:" + (-rp_rpSal));
                        rewordPunishService.addRP(rewordPunish);//添加旷工的奖惩记录

                        for (RewordPunish rp : rewordPunishList) {
                            s_rpSal += rp.getRp_rpSal();
                        }
                        s_rpSal += rp_rpSal;//总的奖惩金额
                    } else { //上下班都打卡的次数超过22天,
                        String str = null;
                        for (int i = 0; i < 22; i++) {//前22个考勤记录的工作日,每个有奖惩记录的奖惩金额相加
                            str = new SimpleDateFormat("yyyy-MM-dd").format(attendanceList.get(i).getAt_startTime());
                            for (RewordPunish rp : rewordPunishList) {
                                String rpStr = new SimpleDateFormat("yyyy-MM-dd").format(rp.getRp_time());
                                if (str.equals(rpStr)) {
                                    s_rpSal += rp.getRp_rpSal();
                                }
                            }
                        }
                    }
                    s_totalSal = s_baseSal + s_performance - s_socialSecurity + s_rpSal;//总工资
                    salary.setS_rpSal(s_rpSal);
                    salary.setS_totalSal(s_totalSal);
                    salaryService.addSalary(salary);
                }
            }
        }
        if (count>0) {
            return showAllSalary(model);
        }
        model.addAttribute("addSalaryError","没有可发薪的员工!");
        return "adminError";
    }

    @RequestMapping("findSalaryAJAX")
    @ResponseBody
    public List<Salary> findSalaryAJAX(String selectedYear,String selectedMonth)throws Exception{
        int selectedYear1=Integer.parseInt(selectedYear);
        int selectedMonth1=Integer.parseInt(selectedMonth);
        String pickedTime=null;//发薪日期
        if (selectedMonth1<9){
            pickedTime=selectedYear+"-0"+(selectedMonth1+1);
        }else if (selectedMonth1<12){
            pickedTime=selectedYear+"-"+(selectedMonth+1);
        }else{
            pickedTime=selectedYear1+1+"-01";//次年一月发工资
        }
        /*return salaryService.getSalaryByDate(selectedTime);*/
        List<Salary> allSalaryList=salaryService.getAllSalary();
        List<Salary> salaryList=new ArrayList<>();//存放查询到目标月份薪资集合
        for (Salary salary:allSalaryList){
            String sTime=new SimpleDateFormat("yyyy-MM").format(salary.getS_time());
            if (pickedTime.equals(sTime)){
                System.out.println(">>>333>>"+salary);
                salaryList.add(salary);
            }
        }
        return salaryList;
    }

    @RequestMapping("querySalaryReconsider")
    public String querySalaryReconsider(Model model)throws Exception{
        Salary salary=new Salary();
        salary.setS_status(1);//已申请，未审批
        List<Salary> salaryList=salaryService.getSalaryByS_status(salary);
        model.addAttribute("salaryList",salaryList);
        return "querySalaryReconsider";
    }

    @RequestMapping("toPage")
    public String toPage(String choose)throws Exception{
        if ("adminMain".equals(choose)){
            return "adminMain";
        }
        return "empMain";
    }

    @RequestMapping("doReconsider")
    public String doReconsider(Salary salary,String status,Model model)throws Exception{
        Salary salary1=salaryService.getSalaryByS_id(salary);
        if ("3".equals(status)){//审批通过
            model.addAttribute("salary",salary1);
           return "addRewordPunish";
        }
        salary1.setS_status(Integer.parseInt(status));
        salaryService.updateSalary(salary1);
        return querySalaryReconsider(model);
    }
}
