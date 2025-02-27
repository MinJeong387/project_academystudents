package com.thirdproject.repository;

import java.util.List;

import com.thirdproject.repository.vo.CounselingLogVo;
import com.thirdproject.repository.vo.StudentsVo;

public interface CounselingLogDao {
    public int insert(CounselingLogVo counselingLogVo);
    public int update(CounselingLogVo counselingLogVo);
    public int delete(Integer no);
    public CounselingLogVo selectOne(Integer no);
    public List<CounselingLogVo> selectAll();

    public List<CounselingLogVo> selectByStudent(Integer studentNo);
    public List<StudentsVo> selectAllStudents();

    public List<StudentsVo> selectStudentsByName(String studentName);

    // 페이지네이션 추가
    public List<CounselingLogVo> selectAllPaged(int startRow, int itemsPerPage);
    public List<CounselingLogVo> selectByStudentPaged(Integer studentNo, int startRow, int itemsPerPage);
    public int getTotalCounselingLogs();
    public int getTotalCounselingLogsByStudent(Integer studentNo);
}