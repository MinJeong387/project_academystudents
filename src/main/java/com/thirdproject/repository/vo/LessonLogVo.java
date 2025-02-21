package com.thirdproject.repository.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LessonLogVo {
    private Integer no;
    private Integer uno; // user_no
    private Date date; // lesson_date
    private String contents; // lesson_contents
    private String studentName; // 학생 이름 추가
}