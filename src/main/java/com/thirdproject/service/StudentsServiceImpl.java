package com.thirdproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thirdproject.repository.StudentsDao;
import com.thirdproject.repository.vo.StudentsVo;

@Service
public class StudentsServiceImpl implements StudentsService {

	@Autowired
	private StudentsDao phonebookDaoImpl;
	
	@Override
	public boolean insertPhonebook(StudentsVo phonebookVo) {
		return 
			1 == phonebookDaoImpl.insert(phonebookVo);
	}

	@Override
	public boolean updatePhonebook(StudentsVo phonebookVo) {
		return 1 == phonebookDaoImpl.update(phonebookVo);
	}

	@Override
	public boolean deletePhonebook(Integer id) {
		return 1 == phonebookDaoImpl.delete(id);
	}

	@Override
	public StudentsVo selectPhonebook(Integer id) {
		return phonebookDaoImpl.selectOne(id);
	}

	@Override
	public List<StudentsVo> selectPhonebookList() {
		return phonebookDaoImpl.selectAll();
	}

}