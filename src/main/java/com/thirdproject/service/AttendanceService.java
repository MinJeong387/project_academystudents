// AttendanceService.java
package com.thirdproject.service;

import java.sql.Date;
import java.util.List;

import com.thirdproject.repository.vo.AttendanceVo;
import com.thirdproject.repository.vo.UserVo; // UserVo 추가

public interface AttendanceService {
    List<AttendanceVo> getAllAttendances();
    List<AttendanceVo> getAttendancesByTeacher(Integer teacherNo); // 선생님 번호로 목록 조회
    List<UserVo> getAllTeachers(); // 선생님 목록 조회
    void saveAttendance(AttendanceVo attendanceVo);    
    void updateAttendance(AttendanceVo attendanceVo);
    AttendanceVo getAttendance(Integer studentNo, Date attendanceDate);
    
    List<AttendanceVo> getAttendanceDetails(Integer studentNo);
    AttendanceVo getStudentInfo(Integer studentNo); // 학생 정보 조회
}