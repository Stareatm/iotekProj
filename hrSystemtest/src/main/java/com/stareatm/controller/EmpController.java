package com.stareatm.controller;

import com.stareatm.model.Interview;
import com.stareatm.service.InterviewService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by 刘 on 2018/4/23.
 */
@Controller
@RequestMapping("/empController")
public class EmpController {
    @Resource
    private InterviewService interviewService;
    @RequestMapping("toAddEmp")
    public String toAddEmp(Interview interview,Model model)throws Exception{
        Interview interview1=interviewService.getInterview_Rs_Job(interview);
        model.addAttribute("interview",interview1);
        return "addEmp";
    }
}
