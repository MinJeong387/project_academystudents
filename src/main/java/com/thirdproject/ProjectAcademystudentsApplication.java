package com.thirdproject;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages="com.thirdproject.mappers")
public class ProjectAcademystudentsApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectAcademystudentsApplication.class, args);
	}

}
