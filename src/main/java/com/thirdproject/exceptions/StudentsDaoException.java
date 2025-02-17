package com.thirdproject.exceptions;

import com.thirdproject.repository.vo.StudentsVo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StudentsDaoException extends RuntimeException {
	private StudentsVo phonebookVo = null;

	public StudentsDaoException(String message, 
								Throwable cause) {
		super(message, cause);
	}
	public StudentsDaoException(String message,
								Throwable cause,
								StudentsVo vo) {
		super(message, cause);
		this.phonebookVo = vo;
	}
	
	
}