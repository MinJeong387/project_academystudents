package com.thirdproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thirdproject.repository.LessonLogDao;
import com.thirdproject.repository.vo.LessonLogVo;
import com.thirdproject.repository.vo.UserVo;

@Service
public class LessonLogServiceImpl implements LessonLogService {

    @Autowired
    private LessonLogDao lessonLogDaoImpl;

    @Override
    public boolean insertLessonLog(LessonLogVo lessonLogVo) {
        return 1 == lessonLogDaoImpl.insert(lessonLogVo);
    }

    @Override
    public boolean updateLessonLog(LessonLogVo lessonLogVo) {
        return 1 == lessonLogDaoImpl.update(lessonLogVo);
    }

    @Override
    public boolean deleteLessonLog(Integer no) {
        return 1 == lessonLogDaoImpl.delete(no);
    }

    @Override
    public LessonLogVo selectLessonLog(Integer no) {
        return lessonLogDaoImpl.selectOne(no);
    }

    @Override
    public List<LessonLogVo> selectLessonLogList() {
        return lessonLogDaoImpl.selectAll();
    }
    
    @Override
    public List<LessonLogVo> selectLessonLogListByUser(Integer userNo) {
        return lessonLogDaoImpl.selectByUser(userNo);
    }

    @Override
    public List<Integer> getAllUserNos() {
        return lessonLogDaoImpl.selectAllUserNos();
    }
    
    @Override
    public List<UserVo> getAllUsers() {
        return lessonLogDaoImpl.selectAllUsers();
    }
}