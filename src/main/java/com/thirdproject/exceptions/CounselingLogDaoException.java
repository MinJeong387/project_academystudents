package com.thirdproject.exceptions;

import com.thirdproject.repository.vo.CounselingLogVo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CounselingLogDaoException extends RuntimeException {

	private CounselingLogVo counselingLogVo = null;

	public CounselingLogDaoException(String message, Throwable cause) {
		super(message, cause);
	}

	public CounselingLogDaoException(String message, Throwable cause, CounselingLogVo vo) {
		super(message, cause);
		this.counselingLogVo = vo;
	}
}