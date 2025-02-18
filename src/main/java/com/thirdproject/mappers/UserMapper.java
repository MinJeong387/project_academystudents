package com.thirdproject.mappers;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.thirdproject.repository.vo.UserVo;

@Mapper
public interface UserMapper {
	// <insert id="insert" parameterType="userVo">
	int insert(UserVo vo);
	
	// <select id="selectUserByEmailAndPassword" parameterType="map" resultType="userVo">
	UserVo selectUserByIdAndPw(Map<String, String> map);
	
	// <select id="selectUserByEmail" parameterType="string" resultType="userVo">
	UserVo selectUserById(String email);

}
