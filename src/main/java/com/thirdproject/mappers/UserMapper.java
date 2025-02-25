package com.thirdproject.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.thirdproject.repository.vo.UserVo;

@Mapper
public interface UserMapper {
	// <insert id="insert" parameterType="userVo">
	int insert(UserVo vo);

	// <select id="selectUserById" parameterType="string" resultType="userVo">
	UserVo selectUserById(String id);

	// <select id="selectUserByCellPhone" parameterType="string" resultType="userVo">
	UserVo selectUserByCellPhone(String cellPhone);

	// <select id="selectUserByIdAndPw" parameterType="map" resultType="userVo">
	UserVo selectUserByIdAndPw(Map<String, String> map);

	List<UserVo> selectAll();
}
