package com.thirdproject.repository;

import java.util.List;

import com.thirdproject.repository.vo.StudentsVo;

public interface StudentsDao {
	public int insert(StudentsVo phonebookVo);
	public int update(StudentsVo phonebookVo);
	public int delete(Integer id);
	public StudentsVo selectOne(Integer id);
	public List<StudentsVo> selectAll();
} 