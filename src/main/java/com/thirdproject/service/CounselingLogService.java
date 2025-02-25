package com.thirdproject.service;

import java.util.List;

import com.thirdproject.repository.vo.CounselingLogVo;
import com.thirdproject.repository.vo.StudentsVo;

public interface CounselingLogService {
    public boolean insertCounselingLog(CounselingLogVo counselingLogVo);
    public boolean updateCounselingLog(CounselingLogVo counselingLogVo);
    public boolean deleteCounselingLog(Integer no);
    public CounselingLogVo selectCounselingLog(Integer no);
    public List<CounselingLogVo> selectCounselingLogList();
    
    public List<CounselingLogVo> selectCounselingLogListByStudent(Integer studentNo);
    public List<StudentsVo> getAllStudents();    
    
    public List<StudentsVo> getStudentNumbersByName(String studentName);
    
}