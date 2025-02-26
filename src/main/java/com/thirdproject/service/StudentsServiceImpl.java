package com.thirdproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thirdproject.repository.StudentsDao;
import com.thirdproject.repository.vo.StudentsVo;

@Service
public class StudentsServiceImpl implements StudentsService {

	@Autowired
	private StudentsDao studentsDaoImpl;

	@Override
	public boolean insertStudents(StudentsVo studentsVo) {
		return 1 == studentsDaoImpl.insert(studentsVo);
	}

	@Override
	public boolean updateStudents(StudentsVo studentsVo) {
		return 1 == studentsDaoImpl.update(studentsVo);
	}

	@Override
	public boolean deleteStudents(Integer no) {
		return 1 == studentsDaoImpl.delete(no);
	}

	@Override
	public StudentsVo selectStudents(Integer no) {
		return studentsDaoImpl.selectOne(no);
	}

	@Override
	public List<StudentsVo> selectStudentsList() {
		return studentsDaoImpl.selectAll();
	}
	
	@Override
    public boolean isStudentCellphoneDuplicate(String studentCellphone) {
        return studentsDaoImpl.countByStudentCellphone(studentCellphone) > 0;
    }
	
	@Override
    public boolean isStudentCellphoneDuplicateForUpdate(String studentCellphone, Integer no) {
        // 수정 시에는 자기 자신의 연락처는 중복 검사에서 제외해야 합니다.
        StudentsVo existingStudent = studentsDaoImpl.selectOne(no);
        if (existingStudent != null && existingStudent.getStudentCellphone().equals(studentCellphone)) {
            return false; // 자기 자신의 연락처는 중복 아님
        }
        return studentsDaoImpl.countByStudentCellphone(studentCellphone) > 0;
    }

}