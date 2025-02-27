package com.thirdproject.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thirdproject.exceptions.CounselingLogDaoException;
import com.thirdproject.mappers.CounselingLogMapper;
import com.thirdproject.repository.vo.CounselingLogVo;
import com.thirdproject.repository.vo.StudentsVo;

@Repository
public class CounselingLogDaoImpl implements CounselingLogDao {
    @Autowired
    private CounselingLogMapper counselingLogMapper;

    @Override
    public int insert(CounselingLogVo counselingLogVo) {
        try {
            return counselingLogMapper.insert(counselingLogVo);
        } catch (Exception e) {
            throw new CounselingLogDaoException("상담일지 입력 중 예외 발생", e, counselingLogVo);
        }
    }

    @Override
    public int update(CounselingLogVo counselingLogVo) {
        try {
            return counselingLogMapper.update(counselingLogVo);
        } catch (Exception e) {
            throw new CounselingLogDaoException("상담일지 수정 중 예외 발생", e, counselingLogVo);
        }
    }

    @Override
    public int delete(Integer no) {
        try {
            return counselingLogMapper.delete(no);
        } catch (Exception e) {
            throw new CounselingLogDaoException("상담일지 삭제 중 오류 발생: " + no, e);
        }
    }

    @Override
    public CounselingLogVo selectOne(Integer no) {
        CounselingLogVo counselingLogVo = counselingLogMapper.selectOne(no);
        return counselingLogVo;
    }

    @Override
    public List<CounselingLogVo> selectAll() {
        List<CounselingLogVo> list = counselingLogMapper.selectAll();
        return list;
    }

    @Override
    public List<CounselingLogVo> selectByStudent(Integer studentNo) {
        return counselingLogMapper.selectByStudent(studentNo);
    }

    @Override
    public List<StudentsVo> selectAllStudents() {
        return counselingLogMapper.selectAllStudents();
    }

    @Override
    public List<StudentsVo> selectStudentsByName(String studentName) {
        return counselingLogMapper.selectStudentsByName(studentName);
    }

    // 페이지네이션 추가
    @Override
    public List<CounselingLogVo> selectAllPaged(int startRow, int itemsPerPage) {
        return counselingLogMapper.selectAllPaged(startRow, itemsPerPage);
    }

    @Override
    public List<CounselingLogVo> selectByStudentPaged(Integer studentNo, int startRow, int itemsPerPage) {
        return counselingLogMapper.selectByStudentPaged(studentNo, startRow, itemsPerPage);
    }

    @Override
    public int getTotalCounselingLogs() {
        return counselingLogMapper.getTotalCounselingLogs();
    }

    @Override
    public int getTotalCounselingLogsByStudent(Integer studentNo) {
        return counselingLogMapper.getTotalCounselingLogsByStudent(studentNo);
    }
}