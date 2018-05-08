package com.stareatm.service;

import com.stareatm.model.Salary;

import java.util.List;

/**
 * Created by 刘 on 2018/5/2.
 */
public interface SalaryService {
    List<Salary> getSalaryByE_id(Salary salary);
    Salary getSalaryByS_id(Salary salary);
    boolean updateSalary(Salary salary);
    boolean addSalary(Salary salary);
    List<Salary> getSalaryByDate(String selectedTime);
    List<Salary> getAllSalary();
    List<Salary> getSalaryByS_status(Salary salary);
}
