package com.stareatm.service.impl;

import com.stareatm.dao.AttendanceMapper;
import com.stareatm.model.Attendance;
import com.stareatm.service.AttendanceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 刘 on 2018/5/3.
 */
@Service
public class AttendanceServiceImpl implements AttendanceService {
    @Resource
    private AttendanceMapper attendanceMapper;
    @Override
    public List<Attendance> getAttendanceByE_id(Attendance attendance) {
        return attendanceMapper.getAttendanceByE_id(attendance);
    }

    @Override
    public boolean updateAttendance(Attendance attendance) {
        return attendanceMapper.updateAttendance(attendance);
    }

    @Override
    public boolean addAttendance(Attendance attendance) {
        return attendanceMapper.addAttendance(attendance);
    }

    @Override
    public List<Attendance> getAttendanceByE_idAt_endTime(Attendance attendance) {
        return attendanceMapper.getAttendanceByE_idAt_endTime(attendance);
    }
}
