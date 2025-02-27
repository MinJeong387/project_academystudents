package com.thirdproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thirdproject.repository.CounselingLogDao;
import com.thirdproject.repository.vo.CounselingLogVo;
import com.thirdproject.repository.vo.StudentsVo;

@Service
public class CounselingLogServiceImpl implements CounselingLogService {

    @Autowired
    private CounselingLogDao counselingLogDaoImpl;

    @Override
    public boolean insertCounselingLog(CounselingLogVo counselingLogVo) {
        return 1 == counselingLogDaoImpl.insert(counselingLogVo);
    }

    @Override
    public boolean updateCounselingLog(CounselingLogVo counselingLogVo) {
        return 1 == counselingLogDaoImpl.update(counselingLogVo);
    }

    @Override
    public boolean deleteCounselingLog(Integer no) {
        return 1 == counselingLogDaoImpl.delete(no);
    }

    @Override
    public CounselingLogVo selectCounselingLog(Integer no) {
        return counselingLogDaoImpl.selectOne(no);
    }

    @Override
    public List<CounselingLogVo> selectCounselingLogList() {
        return counselingLogDaoImpl.selectAll();
    }

    @Override
    public List<CounselingLogVo> selectCounselingLogListByStudent(Integer studentNo) {
        return counselingLogDaoImpl.selectByStudent(studentNo);
    }

    @Override
    public List<StudentsVo> getAllStudents() {
        return counselingLogDaoImpl.selectAllStudents();
    }

    @Override
    public List<StudentsVo> getStudentNumbersByName(String studentName) {
        return counselingLogDaoImpl.selectStudentsByName(studentName);
    }

    // 페이지네이션 추가
    @Override
    public List<CounselingLogVo> selectCounselingLogListPaged(int startRow, int itemsPerPage) {
        return counselingLogDaoImpl.selectAllPaged(startRow, itemsPerPage);
    }

    @Override
    public List<CounselingLogVo> selectCounselingLogListByStudentPaged(Integer studentNo, int startRow, int itemsPerPage) {
        return counselingLogDaoImpl.selectByStudentPaged(studentNo, startRow, itemsPerPage);
    }

    @Override
    public int getTotalCounselingLogs() {
        return counselingLogDaoImpl.getTotalCounselingLogs();
    }

    @Override
    public int getTotalCounselingLogsByStudent(Integer studentNo) {
        return counselingLogDaoImpl.getTotalCounselingLogsByStudent(studentNo);
    }
}