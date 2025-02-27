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
    private StudentsMapper studentsMapper;

    @Override
    public int insert(StudentsVo studentsVo) {
        try {
            return studentsMapper.insert(studentsVo);
        } catch (Exception e) {
            throw new StudentsDaoException("전화번호 입력 중 예외 발생", e, studentsVo);
        }
    }

    @Override
    public int update(StudentsVo studentsVo) {
        try {
            return studentsMapper.update(studentsVo);
        } catch (Exception e) {
            throw new StudentsDaoException("전화번호 입력 중 예외 발생", e, studentsVo);
        }
    }

    @Override
    public int delete(Integer no) {
        try {
            return studentsMapper.delete(no);
        } catch (Exception e) {
            throw new StudentsDaoException("전화번호 삭제 중 오류 발생: " + no, e);
        }
    }

    @Override
    public StudentsVo selectOne(Integer no) {
        StudentsVo studentsVo = studentsMapper.selectOne(no);
        return studentsVo;
    }

    @Override
    public List<StudentsVo> selectAll() {
        List<StudentsVo> list = studentsMapper.selectAll();
        return list;
    }

    @Override
    public int countByStudentCellphone(String studentCellphone) {
        return studentsMapper.countByStudentCellphone(studentCellphone);
    }

    // 전체 학생 수 조회 메소드 구현
    @Override
    public int getTotalStudents() {
        return studentsMapper.getTotalStudents();
    }

    // 전체 선생님 수 조회 메소드 구현
    @Override
    public int getTotalTeachers() {
        return studentsMapper.getTotalTeachers();
    }

    @Override
    public List<StudentsVo> searchStudents(String searchKeyword) {
        return studentsMapper.searchStudents(searchKeyword);
    }

    // 페이지네이션 추가
    @Override
    public List<StudentsVo> selectAllPaged(int startRow, int itemsPerPage) {
        return studentsMapper.selectAllPaged(startRow, itemsPerPage);
    }

    @Override
    public List<StudentsVo> searchStudentsPaged(String searchKeyword, int startRow, int itemsPerPage) {
        return studentsMapper.searchStudentsPaged(searchKeyword, startRow, itemsPerPage);
    }

    @Override
    public int getTotalSearchStudents(String searchKeyword) {
        return studentsMapper.getTotalSearchStudents(searchKeyword);
    }
}