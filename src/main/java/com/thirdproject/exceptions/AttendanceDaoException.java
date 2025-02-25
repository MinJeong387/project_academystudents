package com.thirdproject.exceptions;

import com.thirdproject.repository.vo.AttendanceVo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AttendanceDaoException extends RuntimeException {
	
	private AttendanceVo attendanceVo = null;

	public AttendanceDaoException(String message, Throwable cause) {
		super(message, cause);
	}

	public AttendanceDaoException(String message, Throwable cause, AttendanceVo vo) {
		super(message, cause);
		this.attendanceVo = vo;
	}

}

