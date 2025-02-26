package com.thirdproject.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thirdproject.mappers.AttendanceMapper;
import com.thirdproject.repository.vo.AttendanceVo;
import com.thirdproject.repository.vo.UserVo;

@Repository
public class AttendanceDaoImpl implements AttendanceDao {

	@Autowired
    private AttendanceMapper attendanceMapper;

    @Override
    public List<AttendanceVo> selectAllAttendances() {
        return attendanceMapper.selectAllAttendances();
    }

	@Override
	public List<AttendanceVo> selectAttendancesByTeacher(Integer teacherNo) {
		return attendanceMapper.selectAttendancesByTeacher(teacherNo);
	}

	@Override
	public List<UserVo> selectAllTeachers() {
		return attendanceMapper.selectAllTeachers();
	}

	@Override
	public void insertAttendance(AttendanceVo attendanceVo) {
		attendanceMapper.insertAttendance(attendanceVo);
	}

	@Override
	public void updateAttendance(AttendanceVo attendanceVo) {
		attendanceMapper.updateAttendance(attendanceVo);
	}
	
	@Override
    public AttendanceVo selectAttendance(Integer studentNo, Date attendanceDate) {
        return attendanceMapper.selectAttendance(studentNo, attendanceDate);
    }
	
	@Override
	public List<AttendanceVo> selectAttendanceDetails(Integer studentNo) {
	    return attendanceMapper.selectAttendanceDetails(studentNo);
	}
}