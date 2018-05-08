package com.stareatm.dao;

import com.stareatm.model.Attendance;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 刘 on 2018/5/3.
 */
@Repository
public interface AttendanceMapper {
    List<Attendance> getAttendanceByE_id(Attendance attendance);
    boolean updateAttendance(Attendance attendance);
    boolean addAttendance(Attendance attendance);
    List<Attendance> getAttendanceByE_idAt_endTime(Attendance attendance);
}
