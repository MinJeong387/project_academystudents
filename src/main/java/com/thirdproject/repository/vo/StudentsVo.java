package com.thirdproject.repository.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*	
 	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(10),
    hp VARCHAR(20),
    tel VARCHAR(20)
 */
@NoArgsConstructor	//	기본 생성자
@AllArgsConstructor	//	전체 생성자
@Getter				//	Getters
@Setter				//	Setters
@ToString			//	toString
public class StudentsVo {
	private Integer id;
	private String name;
	private String hp;
	private String tel;

}