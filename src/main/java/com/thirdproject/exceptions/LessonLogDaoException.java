package com.thirdproject.exceptions;

import com.thirdproject.repository.vo.LessonLogVo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LessonLogDaoException extends RuntimeException {

    private LessonLogVo lessonLogVo = null;

    public LessonLogDaoException(String message, Throwable cause) {
        super(message, cause);
    }

    public LessonLogDaoException(String message, Throwable cause, LessonLogVo vo) {
        super(message, cause);
        this.lessonLogVo = vo;
    }
}