package com.thirdproject.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thirdproject.exceptions.LessonLogDaoException;
import com.thirdproject.mappers.LessonLogMapper;
import com.thirdproject.repository.vo.LessonLogVo;

@Repository
public class LessonLogDaoImpl implements LessonLogDao {
    @Autowired
    private LessonLogMapper lessonLogMapper;

    @Override
    public int insert(LessonLogVo lessonLogVo) {
        try {
            return lessonLogMapper.insert(lessonLogVo);
        } catch (Exception e) {
            throw new LessonLogDaoException("수업일지 입력 중 예외 발생", e, lessonLogVo);
        }
    }

    @Override
    public int update(LessonLogVo lessonLogVo) {
        try {
            return lessonLogMapper.update(lessonLogVo);
        } catch (Exception e) {
            throw new LessonLogDaoException("수업일지 수정 중 예외 발생", e, lessonLogVo);
        }
    }

    @Override
    public int delete(Integer no) {
        try {
            return lessonLogMapper.delete(no);
        } catch (Exception e) {
            throw new LessonLogDaoException("수업일지 삭제 중 오류 발생: " + no, e);
        }
    }

    @Override
    public LessonLogVo selectOne(Integer no) {
        LessonLogVo lessonLogVo = lessonLogMapper.selectOne(no);
        return lessonLogVo;
    }

    @Override
    public List<LessonLogVo> selectAll() {
        List<LessonLogVo> list = lessonLogMapper.selectAll();
        return list;
    }
}