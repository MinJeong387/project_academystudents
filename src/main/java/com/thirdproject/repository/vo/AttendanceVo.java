package com.thirdproject.repository.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttendanceVo {
    private Integer studentNo;
    private String studentName;
    private Integer teacherNo;
    private String teacherName;
    private String attendanceStatus;
    private Date attendanceDate;
    
    private String schoolName; // 학교 이름 추가
    private Integer schoolGrade; // 학년 추가
    
}