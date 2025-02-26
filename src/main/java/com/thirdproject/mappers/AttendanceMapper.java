package com.thirdproject.mappers;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.thirdproject.repository.vo.AttendanceVo;
import com.thirdproject.repository.vo.UserVo;

@Mapper
public interface AttendanceMapper {
    List<AttendanceVo> selectAllAttendances();
    List<AttendanceVo> selectAttendancesByTeacher(Integer teacherNo);
    List<UserVo> selectAllTeachers();
    
    void insertAttendance(AttendanceVo attendanceVo);
    void updateAttendance(AttendanceVo attendanceVo);
    
    AttendanceVo selectAttendance(Integer studentNo, Date attendanceDate);
}