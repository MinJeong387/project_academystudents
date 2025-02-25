package com.thirdproject.repository;

import java.util.List;

import com.thirdproject.repository.vo.AttendanceVo;
import com.thirdproject.repository.vo.UserVo; // UserVo 추가

public interface AttendanceDao {
    List<AttendanceVo> selectAllAttendances();
    List<AttendanceVo> selectAttendancesByTeacher(Integer teacherNo); // 선생님 번호로 목록 조회
    List<UserVo> selectAllTeachers(); // 선생님 목록 조회
    
    void insertAttendance(AttendanceVo attendanceVo);
    void updateAttendance(AttendanceVo attendanceVo);
}