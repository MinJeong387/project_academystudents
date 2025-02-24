package com.thirdproject.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.thirdproject.repository.vo.CounselingLogVo;
import com.thirdproject.repository.vo.StudentsVo;

@Mapper
public interface CounselingLogMapper {
    List<CounselingLogVo> selectAll();
    int insert(CounselingLogVo counselingLogVo);
    CounselingLogVo selectOne(Integer no);
    int update(CounselingLogVo counselingLogVo);
    int delete(Integer no);
    
    List<CounselingLogVo> selectByStudent(Integer studentNo);
    List<StudentsVo> selectAllStudents();
    
    List<StudentsVo> selectStudentsByName(String studentName);
}