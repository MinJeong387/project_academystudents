package com.thirdproject.service;

import java.util.List;

import com.thirdproject.repository.vo.StudentsVo;

public interface StudentsService {
	public boolean insertStudents(StudentsVo studentsVo);
	public boolean updateStudents(StudentsVo studentsVo);
	public boolean deleteStudents(Integer no);
	public StudentsVo selectStudents(Integer no);
	public List<StudentsVo> selectStudentsList();
	
}