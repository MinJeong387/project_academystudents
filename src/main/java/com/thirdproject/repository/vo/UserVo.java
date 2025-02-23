package com.thirdproject.repository.vo;

import jakarta.validation.constraints.NotEmpty;
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
	private String pw;

	@NotEmpty
	private String name;

	@NotEmpty
	private String cellPhone;
	
	@Override
    public String toString() {
        String result = no + " - " + name;
        System.out.println("UserVo.toString(): " + result); // 디버깅 출력
        return result;
    }

}