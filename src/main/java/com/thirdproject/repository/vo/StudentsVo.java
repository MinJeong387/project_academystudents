package com.thirdproject.repository.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudentsVo {
	private Integer no;
	private String name;
	private String schoolName;
	private Integer schoolGrade;
	private String birthdate;
	private String gender;
	private String studentCellphone;
	private String parentCellphone;
	private String comments;
	private String teacherNo;
	
	private String teacherName; // 선생님 이름 필드 추가	
	
}