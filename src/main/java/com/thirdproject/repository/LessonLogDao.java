package com.thirdproject.repository;

import java.util.List;

import com.thirdproject.repository.vo.LessonLogVo;

public interface LessonLogDao {
    public int insert(LessonLogVo lessonLogVo);
    public int update(LessonLogVo lessonLogVo);
    public int delete(Integer no);
    public LessonLogVo selectOne(Integer no);
    public List<LessonLogVo> selectAll();
}