package com.thirdproject.service;

import java.util.List;

import com.thirdproject.repository.vo.LessonLogVo;
import com.thirdproject.repository.vo.UserVo;

public interface LessonLogService {
    public boolean insertLessonLog(LessonLogVo lessonLogVo);
    public boolean updateLessonLog(LessonLogVo lessonLogVo);
    public boolean deleteLessonLog(Integer no);
    public LessonLogVo selectLessonLog(Integer no);
    public List<LessonLogVo> selectLessonLogList();
    
    public List<LessonLogVo> selectLessonLogListByUser(Integer userNo);
    public List<Integer> getAllUserNos();
    public List<UserVo> getAllUsers();
}