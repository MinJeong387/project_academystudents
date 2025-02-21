package com.thirdproject.repository.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CounselingLogVo {
    private Integer no;
    private Integer sno; // student_no
    private Date date; // counseling_date
    private String contents; // counseling_contents
    private String studentName; // 학생 이름 추가

}