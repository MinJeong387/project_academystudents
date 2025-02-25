package com.thirdproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thirdproject.repository.AttendanceDao;
import com.thirdproject.repository.vo.AttendanceVo;
import com.thirdproject.repository.vo.UserVo; // UserVo 추가

@Service
public class AttendanceServiceImpl implements AttendanceService {

    @Autowired
    private AttendanceDao attendanceDao;

    @Override
    public List<AttendanceVo> getAllAttendances() {
        return attendanceDao.selectAllAttendances();
    }

    @Override
    public List<AttendanceVo> getAttendancesByTeacher(Integer teacherNo) {
        return attendanceDao.selectAttendancesByTeacher(teacherNo); // 선생님 번호로 목록 조회
    }

    @Override
    public List<UserVo> getAllTeachers() {
        return attendanceDao.selectAllTeachers(); // 선생님 목록 조회
    }
    
    @Override
    public void saveAttendance(AttendanceVo attendanceVo) {
        attendanceDao.insertAttendance(attendanceVo);
    }
    
    @Override
    public void updateAttendance(AttendanceVo attendanceVo) {
    	
        attendanceDao.updateAttendance(attendanceVo);
    }
}