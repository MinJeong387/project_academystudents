package com.thirdproject.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thirdproject.exceptions.StudentsDaoException;
import com.thirdproject.mappers.StudentsMapper;
import com.thirdproject.repository.vo.StudentsVo;

@Repository
public class StudentsDaoImpl implements StudentsDao {
	@Autowired
	private StudentsMapper phonebookMapper;
	
	@Override
	public int insert(StudentsVo phonebookVo) {
		try {
			return phonebookMapper.insert(phonebookVo);
		} catch (Exception e) {
			throw new StudentsDaoException("전화번호 입력 중 예외 발생", 
											e, 
											phonebookVo );
		}
	}

	@Override
	public int update(StudentsVo phonebookVo) {
		try {
			return phonebookMapper.update(phonebookVo);
		} catch (Exception e) {
			throw new StudentsDaoException("전화번호 수정 중 예외 발생",
											e,
											phonebookVo);
		}
	}

	@Override
	public int delete(Integer id) {
		try {
			return phonebookMapper.delete(id);
		} catch (Exception e) {
			throw new StudentsDaoException(
					"전화번호 삭제 중 오류 발생: " +id, e);
		}
	}

	@Override
	public StudentsVo selectOne(Integer id) {
		StudentsVo phonebookVo = 
				phonebookMapper.selectOne(id);
		return phonebookVo;
	}

	@Override
	public List<StudentsVo> selectAll() {
		List<StudentsVo> list = 
				phonebookMapper.selectAll();
		return list;
	}

}