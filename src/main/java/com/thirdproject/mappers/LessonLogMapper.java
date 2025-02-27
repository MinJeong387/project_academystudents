package com.thirdproject.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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

    // 페이지네이션 추가
    List<LessonLogVo> selectAllPaged(@Param("startRow") int startRow, @Param("itemsPerPage") int itemsPerPage);
    List<LessonLogVo> selectByUserPaged(@Param("userNo") Integer userNo, @Param("startRow") int startRow, @Param("itemsPerPage") int itemsPerPage);
    int getTotalLessonLogs();
    int getTotalLessonLogsByUser(@Param("userNo") Integer userNo);
}