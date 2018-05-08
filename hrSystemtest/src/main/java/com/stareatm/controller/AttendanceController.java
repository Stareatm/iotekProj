package com.stareatm.controller;

import com.stareatm.model.Attendance;
import com.stareatm.model.Emp;
import com.stareatm.model.RewordPunish;
import com.stareatm.service.AttendanceService;
import com.stareatm.service.RewordPunishService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by 刘 on 2018/5/3.
 */
@Controller
@RequestMapping("attendanceController")
public class AttendanceController {
    @Resource
    private AttendanceService attendanceService;
    @Resource
    private RewordPunishService rewordPunishService;

    @RequestMapping("addOrUpdateAttendance")
    public void addOrUpdateAttendance(HttpSession session, HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/java;charset=utf-8");
        Emp emp= (Emp) session.getAttribute("emp");
        Attendance attendance=new Attendance();
        attendance.setEmp(emp);//添加员工
        List<Attendance> attendanceList=attendanceService.getAttendanceByE_id(attendance);
        Date date=new Date();
        String currentStr=new SimpleDateFormat("yyyy-MM-dd").format(date);
        String currentStr1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);//具体时间
        String timeStr1=currentStr+" 09:00:00";//上班时间
        Date date1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(timeStr1);////上班时间点日期格式
        String message=null;
        for (int i=0;i<attendanceList.size();i++){
            Attendance attendance1=attendanceList.get(i);
            Date startTime=attendance1.getAt_startTime();//上班卡记录
            String startStr=new SimpleDateFormat("yyyy-MM-dd").format(startTime);
            Date endTime=attendance1.getAt_endTime();//下班卡记录
            String timeStr2=currentStr+" 13:00:00";//可以下班打卡点
            String timeStr3=currentStr+" 18:00:00";//下班时间
            Date date3=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(timeStr3);////下班时间点日期格式
            String timeStr4=currentStr+" 19:00:00";//加班开始时间
            Date date4=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(timeStr4);////加班时间点日期格式
            if (currentStr.equals(startStr)){//当天已上班打卡
                if (currentStr1.compareTo(timeStr2)>0){//超过13:00:00,可以下班打卡
                    attendance1.setAt_endTime(date);
                    attendanceService.updateAttendance(attendance1);
                    if (null==endTime){//未打下班卡
                        if(currentStr1.compareTo(timeStr3)>0){//正常打卡下班
                            message="打卡成功!正常打卡下班!";
                        }else {
                            //早退卡
                            message = "打卡成功!早退卡!";
                        }
                    }else {
                        //跟新打卡
                        if (currentStr1.compareTo(timeStr3) > 0) {
                            message = "跟新打卡成功!正常打卡下班!";
                        }else {
                            message = "跟新打卡成功!早退卡!";
                        }
                    }


                    long startSecond=(date1.getTime()-startTime.getTime())/1000;//判断是否迟到
                    long endSecond=(date.getTime()-date3.getTime())/1000;//判断是否早退
                    int totalHour=0;//迟到早退总小时数
                    long rewordSecond1=(date.getTime()-date4.getTime())/1000;//上班卡在19:00之前
                    long rewordSecond2=(date.getTime()-startTime.getTime())/1000;//上班卡在19:00之后
                    int rewordHour=0;
                    int hour1= (int) (startSecond/3600);//迟到
                    int minutes1= (int) (startSecond%3600/60);
                    int second1= (int) (startSecond%60);
                    int hour2= (int) (endSecond/3600);//早退
                    int minutes2= (int) (endSecond%3600/60);
                    int second2= (int) (endSecond%60);
                    RewordPunish rewordPunish=new RewordPunish();
                    rewordPunish.setEmp(emp);
                    List<RewordPunish> rewordPunishList=rewordPunishService.getAllRewordPunishByE_id(rewordPunish);
                    int pSal=0;//处罚
                    int rSal=0;//奖励
                    if(date1.compareTo(startTime)<0){//迟到
                        if (date.compareTo(date3)<0){//6点之前打早退卡
                            totalHour= (int) ((endSecond+startSecond)%3600==0 ? (endSecond+startSecond)/3600 :(endSecond+startSecond)/3600+1);
                            if (-totalHour<=3) {
                                pSal= totalHour * 50;
                            }else{
                                pSal=-emp.getE_baseSal()/30;
                            }
                            rewordPunish.setRp_reason("迟到 "+(-hour1)+"小时:"+(-minutes1)+"分钟:"+(-second1)+"秒;早退 "+
                                    (-hour2)+"小时:"+(-minutes2)+"分钟:"+(-second2)+"秒;扣除工资"+(-pSal)+"元");
                        }else{
                            if (date.compareTo(date4)<=0){//6-7点打卡,正常打卡下班
                                totalHour= (int) (startSecond%3600==0? startSecond/3600 :(startSecond/3600+1));
                                if (-totalHour<=3) {
                                    pSal= totalHour * 50;
                                }else{
                                    pSal=-emp.getE_baseSal()/30;
                                }
                                rewordPunish.setRp_reason("迟到 "+(-hour1)+"小时:"+(-minutes1)+"分钟:"+(-second1)+"秒;扣除工资"+(-pSal)+"元");
                            }else{//7点之后打下班卡,加班
                                if (date4.compareTo(startTime)>=0){//上班打卡在7点加班之前
                                    rewordHour= (int) (rewordSecond1%3600==0? rewordSecond1/3600 :(rewordSecond1/3600+1));//正数
                                }else{//上班打卡在7点加班之后
                                    rewordHour= (int) (rewordSecond2%3600==0? rewordSecond2/3600 :(rewordSecond2/3600+1));//正数
                                }
                                totalHour= (int) (startSecond%3600==0? startSecond/3600 :(startSecond/3600+1));//负数
                                if (-totalHour<=3) {
                                    pSal=totalHour * 50;
                                }else{
                                    pSal=-emp.getE_baseSal()/30;
                                }
                                rSal=emp.getE_baseSal()/120*rewordHour;
                                rewordPunish.setRp_reason("迟到 "+(-hour1)+"小时:"+(-minutes1)+"分钟:"+(-second1)+"秒,扣除工资"+(-pSal)+
                                        "元;加班"+rewordHour+"小时以内,奖励工资:"+rSal+"元");
                            }
                        }
                    }else{//未迟到
                        if (date.compareTo(date3)<0){//6点之前打早退卡
                            totalHour= (int) (endSecond%3600==0 ? endSecond/3600 :(endSecond/3600+1));
                            if (-totalHour<=3) {
                                pSal= totalHour * 50;
                            }else{
                                pSal=-emp.getE_baseSal()/30;
                            }
                            rewordPunish.setRp_reason("早退 "+(-hour2)+"小时:"+(-minutes2)+"分钟:"+(-second2)+"秒;扣除工资"+(-pSal)+"元");
                        }else{
                            if (date.compareTo(date4)>0){//7点之后打下班卡,加班
                                rewordHour= (int) (rewordSecond2%3600==0? rewordSecond2/3600 :(rewordSecond2/3600+1));//正数
                                rSal=emp.getE_baseSal()/120*rewordHour;
                                rewordPunish.setRp_reason("加班"+rewordHour+"小时以内,奖励工资:"+rSal+"元");
                            }
                        }
                    }
                    rewordPunish.setEmp(emp);
                    rewordPunish.setRp_time(date);
                    rewordPunish.setRp_rpSal(rSal+pSal);
                    for (int j=0;j<rewordPunishList.size();j++){
                        RewordPunish rewordPunish1=rewordPunishList.get(j);
                        Date rp_time=rewordPunish1.getRp_time();
                        String rpStr=new SimpleDateFormat("yyyy-MM-dd").format(rp_time);
                        if (currentStr.equals(rpStr)){//奖惩已存在,更新奖惩
                            rewordPunish1.setRp_time(date);
                            rewordPunish1.setRp_reason(rewordPunish.getRp_reason());
                            rewordPunish1.setRp_rpSal(rewordPunish.getRp_rpSal());
                            rewordPunishService.updateRP(rewordPunish1);
                            response.getWriter().print(message);
                            return;
                        }
                    }
                    rewordPunishService.addRP(rewordPunish);//添加
                }else {
                    //不可打下班卡
                    message = "已上班打卡,未到13:00:00,不能打下班卡!";
                }
                response.getWriter().print(message);
                return;
            }
        }
        //当天未打卡,可打上班卡
        attendance.setAt_startTime(date);//添加上班打卡
        attendanceService.addAttendance(attendance);
        if (currentStr1.compareTo(timeStr1)<=0){
            message="打卡成功!正常打卡上班!";
        }else{
            message="打卡成功!迟到卡!";
        }
        response.getWriter().print(message);
    }

    @RequestMapping("showAttendance")
    public String  showAttendance(HttpSession session,Model model)throws Exception{
        Emp emp= (Emp) session.getAttribute("emp");
        Attendance attendance=new Attendance();
        attendance.setEmp(emp);
        List<Attendance> attendanceList=attendanceService.getAttendanceByE_id(attendance);
        model.addAttribute("attendanceList",attendanceList);
        return "showAttendance";
    }
}
