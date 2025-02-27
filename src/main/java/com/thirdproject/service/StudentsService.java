package com.thirdproject.service;

import java.util.List;

import com.thirdproject.repository.vo.StudentsVo;

public interface StudentsService {
    public boolean insertStudents(StudentsVo studentsVo);
    public boolean updateStudents(StudentsVo studentsVo);
    public boolean deleteStudents(Integer no);
    public StudentsVo selectStudents(Integer no);
    public List<StudentsVo> selectStudentsList();
    public boolean isStudentCellphoneDuplicate(String studentCellphone); // 추가
    boolean isStudentCellphoneDuplicateForUpdate(String studentCellphone, Integer no);
    public int getTotalStudents();
    public int getTotalTeachers();

    List<StudentsVo> searchStudents(String searchKeyword);

    // 페이지네이션 추가
    List<StudentsVo> selectStudentsListPaged(int startRow, int itemsPerPage);
    List<StudentsVo> searchStudentsPaged(String searchKeyword, int startRow, int itemsPerPage);
    int getTotalSearchStudents(String searchKeyword);
}