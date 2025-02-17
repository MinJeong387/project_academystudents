package com.thirdproject.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.thirdproject.repository.vo.StudentsVo;

//	이 매퍼 인터페이스를 mybatis mapper 설정의 namespace로 등록해 줘야 한다.
@Mapper	//	MyBatis Mapper
public interface StudentsMapper {
//	<select id="selectAll" resultType="phonebookVo">
	List<StudentsVo> selectAll();

//	<insert id="insert" parameterType="phonebookVo">
	int insert(StudentsVo studentsVo);
	
//	<select id="selectOne"
//			parameterType="int"
//			resultType="phonebookVo">
//	@Select("SELECT * FROM phonebook WHERE id=#{id}")
	StudentsVo selectOne(Integer no);
	
//	<update id="update" parameterType="phonebookVo">
	int update(StudentsVo studentsVo);
	
//	<delete id="delete" parameterType="int">
	int delete(Integer no);
}