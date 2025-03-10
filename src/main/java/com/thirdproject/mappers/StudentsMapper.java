package com.thirdproject.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.thirdproject.repository.vo.StudentsVo;

//  이 매퍼 인터페이스를 mybatis mapper 설정의 namespace로 등록해 줘야 한다.
@Mapper    //    MyBatis Mapper
public interface StudentsMapper {

    //    <select id="selectAll" resultType="studentsVo">
    List<StudentsVo> selectAll();

    //    <insert id="insert" parameterType="studentsVo">
    int insert(StudentsVo studentsVo);

    //    <select id="selectOne"
    //            parameterType="int"
    //            resultType="phonebookVo">
    //    @Select("SELECT * FROM phonebook WHERE id=#{id}")
    StudentsVo selectOne(Integer no);

    //    <update id="update" parameterType="studentsVo">
    int update(StudentsVo studentsVo);

    //    <delete id="delete" parameterType="int">
    int delete(Integer no);

    int countByStudentCellphone(String studentCellphone); // 추가

    // 전체 학생 수 조회 메소드 추가
    int getTotalStudents();

    // 전체 선생님 수 조회 메소드 추가
    int getTotalTeachers();

    List<StudentsVo> searchStudents(String searchKeyword);

    // 페이지네이션 추가
    List<StudentsVo> selectAllPaged(@Param("startRow") int startRow, @Param("itemsPerPage") int itemsPerPage);
    List<StudentsVo> searchStudentsPaged(@Param("searchKeyword") String searchKeyword, @Param("startRow") int startRow, @Param("itemsPerPage") int itemsPerPage);
    int getTotalSearchStudents(@Param("searchKeyword") String searchKeyword);
}