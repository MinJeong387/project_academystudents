package com.thirdproject.repository;

import java.util.List;

import com.thirdproject.repository.vo.UserVo;

public interface UserDao {
	public int insert(UserVo vo);
	
	public UserVo selectUserById(String id);
	public UserVo selectUserByIdAndPw(String id, String pw);	
	public UserVo selectUserByCellPhone(String cellPhone);
	
	List<UserVo> selectAll();
}
