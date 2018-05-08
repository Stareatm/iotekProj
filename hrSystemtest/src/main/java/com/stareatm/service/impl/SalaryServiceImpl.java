package com.stareatm.service.impl;

import com.stareatm.dao.SalaryMapper;
import com.stareatm.model.Salary;
import com.stareatm.service.SalaryService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 刘 on 2018/5/2.
 */
@Service
public class SalaryServiceImpl implements SalaryService {
    @Resource
    private SalaryMapper salaryMapper;
    @RequestMapping
    public List<Salary> getSalaryByE_id(Salary salary) {
        return salaryMapper.getSalaryByE_id(salary);
    }

    @Override
    public Salary getSalaryByS_id(Salary salary) {
        return salaryMapper.getSalaryByS_id(salary);
    }

    @Override
    public boolean updateSalary(Salary salary) {
        return salaryMapper.updateSalary(salary);
    }

    @Override
    public boolean addSalary(Salary salary) {
        return salaryMapper.addSalary(salary);
    }

    @Override
    public List<Salary> getSalaryByDate(String selectedTime) {
        return salaryMapper.getSalaryByDate(selectedTime);
    }

    @Override
    public List<Salary> getAllSalary() {
        return salaryMapper.getAllSalary();
    }

    @Override
    public List<Salary> getSalaryByS_status(Salary salary) {
        return salaryMapper.getSalaryByS_status(salary);
    }
}
