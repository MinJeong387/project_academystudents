package com.thirdproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thirdproject.repository.UserDao;
import com.thirdproject.repository.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao userDaoImpl;
	
	@Override
	public boolean join(UserVo vo) {
		return 1 == userDaoImpl.insert(vo);
	}

	@Override
	public UserVo getUser(String id, String pw) {
		return userDaoImpl.selectUserByIdAndPw(id, pw);
	}

	@Override
	public UserVo getUser(String id) {
		return userDaoImpl.selectUserById(id);
	}
	
	@Override
	public UserVo getUserByCellPhone(String cellPhone) {
		return userDaoImpl.selectUserByCellPhone(cellPhone);
	}

	@Override
	public boolean isAuthenticated(HttpServletRequest request) {
		// 세션을 통해서 사용자의 인증 상태를 체크 하는 메서드
		HttpSession session = request.getSession(false);
		
		if (session != null) {
			UserVo authUser = 
				(UserVo)session.getAttribute("authUser");
			return authUser != null;
		}
		return false;
	}
	
	
	
	@Override
    public List<UserVo> selectUserList() {
        return userDaoImpl.selectAll();
    }

}
