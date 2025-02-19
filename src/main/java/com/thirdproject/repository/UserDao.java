package com.thirdproject.repository;

import com.thirdproject.repository.vo.UserVo;

public interface UserDao {
	public int insert(UserVo vo);
	
	public UserVo selectUserById(String id);
	public UserVo selectUserByIdAndPw(String id, String pw);	
	public UserVo selectUserByCellPhone(String cellPhone);
}
