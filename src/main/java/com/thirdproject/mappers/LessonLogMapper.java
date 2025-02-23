package com.thirdproject.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.thirdproject.repository.vo.LessonLogVo;
import com.thirdproject.repository.vo.UserVo;

@Mapper
public interface LessonLogMapper {
    List<LessonLogVo> selectAll();
    int insert(LessonLogVo lessonLogVo);
    LessonLogVo selectOne(Integer no);
    int update(LessonLogVo lessonLogVo);
    int delete(Integer no);
    
    List<LessonLogVo> selectByUser(Integer userNo);
    List<Integer> selectAllUserNos();
    List<UserVo> selectAllUsers();
}