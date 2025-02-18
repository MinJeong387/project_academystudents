package com.thirdproject.repository.vo;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class UserVo {
	private Integer no;

	@NotEmpty
	private String id;

	@NotEmpty
	@Length(min = 4, max = 20)
	private String pw;

	@NotEmpty
	@Length(min = 2, max = 8)
	private String name;

	@NotNull
	private String cellPhone;

}