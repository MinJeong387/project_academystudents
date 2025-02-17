package com.thirdproject.service;

import java.util.List;

import com.thirdproject.repository.vo.StudentsVo;

public interface StudentsService {
	public boolean insertPhonebook(StudentsVo phonebookVo);
	public boolean updatePhonebook(StudentsVo phonebookVo);
	public boolean deletePhonebook(Integer id);
	public StudentsVo selectPhonebook(Integer id);
	public List<StudentsVo> selectPhonebookList();
}