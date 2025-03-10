package com.thirdproject.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thirdproject.exceptions.UserDaoException;
import com.thirdproject.mappers.UserMapper;
import com.thirdproject.repository.vo.UserVo;

@Repository
public class UserDaoImpl implements UserDao {
//	@Autowired
//	SqlSession sqlSession;
	@Autowired
	UserMapper userMapper;

	@Override
	public int insert(UserVo vo) {

		int count = 0;

		try {
			count = userMapper.insert(vo);
		} catch (Exception e) {
			throw new UserDaoException("회원가입중 오류", vo);
		}
//		try {
//			return sqlSession.insert("user.insert", vo);
//		} catch (Exception e) {
//			throw new UserDaoException("회원가입 중 오류", vo);
//		}
		return count;
	}

	// 아이디 중복 체크용
	@Override
	public UserVo selectUserById(String id) {
//		UserVo vo = 
//				sqlSession.selectOne("user.selectUserByEmail", email);
		UserVo vo = userMapper.selectUserById(id);
		return vo;
	}

	// 연락처 중복 체크용
	@Override
	public UserVo selectUserByCellPhone(String cellPhone) {
//			UserVo vo = 
//					sqlSession.selectOne("user.selectUserByEmail", email);
		UserVo vo = userMapper.selectUserByCellPhone(cellPhone);
		return vo;
	}

	// 로그인용
	@Override
	public UserVo selectUserByIdAndPw(String id, String pw) {
//		Map<String, String> userMap 
//			= new HashMap<>();
//		userMap.put("email", email);
//		userMap.put("password", password);
//		
//		UserVo vo = 
//			sqlSession.selectOne("user.selectUserByEmailAndPassword", 
//					userMap);

		Map<String, String> userMap = new HashMap<>();
		userMap.put("id", id);
		userMap.put("pw", pw);

		UserVo vo = userMapper.selectUserByIdAndPw(userMap);

		return vo;
	}
	
	@Override
    public List<UserVo> selectAll() {
        return userMapper.selectAll();
    }
	
	@Override
    public UserVo selectUserByNameAndCellPhone(String name, String cellPhone) {
        Map<String, String> userMap = new HashMap<>();
        userMap.put("name", name);
        userMap.put("cellPhone", cellPhone);
        return userMapper.selectUserByNameAndCellPhone(userMap);
    }
}
