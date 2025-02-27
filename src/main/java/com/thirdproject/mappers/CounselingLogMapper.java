package com.thirdproject.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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

    // 페이지네이션 추가
    List<CounselingLogVo> selectAllPaged(@Param("startRow") int startRow, @Param("itemsPerPage") int itemsPerPage);
    List<CounselingLogVo> selectByStudentPaged(@Param("studentNo") Integer studentNo, @Param("startRow") int startRow, @Param("itemsPerPage") int itemsPerPage);
    int getTotalCounselingLogs();
    int getTotalCounselingLogsByStudent(@Param("studentNo") Integer studentNo);
}