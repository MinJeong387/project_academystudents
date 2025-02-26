package com.thirdproject.repository;

import java.util.List;

import com.thirdproject.repository.vo.StudentsVo;

public interface StudentsDao {
	public int insert(StudentsVo studentsVo);
	public int update(StudentsVo studentsVo);
	public int delete(Integer no);
	public StudentsVo selectOne(Integer no);
	public List<StudentsVo> selectAll();
	public int countByStudentCellphone(String studentCellphone); // 추가
	
	// 전체 학생 수 조회 메소드 추가
    public int getTotalStudents();

    // 전체 선생님 수 조회 메소드 추가
    public int getTotalTeachers();
} 