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

    // 페이지네이션 추가
    public List<LessonLogVo> selectLessonLogListPaged(int startRow, int itemsPerPage);
    public List<LessonLogVo> selectLessonLogListByUserPaged(Integer userNo, int startRow, int itemsPerPage);
    public int getTotalLessonLogs();
    public int getTotalLessonLogsByUser(Integer userNo);
}