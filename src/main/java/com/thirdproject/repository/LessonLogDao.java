package com.thirdproject.repository;

import java.util.List;

import com.thirdproject.repository.vo.LessonLogVo;
import com.thirdproject.repository.vo.UserVo;

public interface LessonLogDao {
    public int insert(LessonLogVo lessonLogVo);
    public int update(LessonLogVo lessonLogVo);
    public int delete(Integer no);
    public LessonLogVo selectOne(Integer no);
    public List<LessonLogVo> selectAll();

    public List<LessonLogVo> selectByUser(Integer userNo);
    public List<Integer> selectAllUserNos();
    public List<UserVo> selectAllUsers();

    // 페이지네이션 추가
    public List<LessonLogVo> selectAllPaged(int startRow, int itemsPerPage);
    public List<LessonLogVo> selectByUserPaged(Integer userNo, int startRow, int itemsPerPage);
    public int getTotalLessonLogs();
    public int getTotalLessonLogsByUser(Integer userNo);
}