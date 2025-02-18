package com.thirdproject.repository;

import com.thirdproject.repository.vo.UserVo;

public interface UserDao {
	public int insert(UserVo vo);
	public UserVo selectUser(String id);
	public UserVo selectUser(String id, String pw);
}
