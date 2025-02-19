package com.thirdproject.service;

import com.thirdproject.repository.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;

public interface UserService {
	public boolean join(UserVo vo);
	public UserVo getUser(String id, String pw);
	public UserVo getUser(String id);
	public UserVo getUserByCellPhone(String cellPhone);
	
	public boolean isAuthenticated(HttpServletRequest request);
	
}