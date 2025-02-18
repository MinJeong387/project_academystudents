package com.thirdproject.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thirdproject.repository.vo.StudentsVo;
import com.thirdproject.service.StudentsService;

@Controller
@RequestMapping("/students")
public class StudentsController {
	private static final Logger logger = LoggerFactory.getLogger(StudentsController.class);

	@Autowired
	private StudentsService studentsServiceImpl;

	@GetMapping("/list")
	public String list(Model model) {
		List<StudentsVo> list = studentsServiceImpl.selectStudentsList();
		logger.debug("STUDENTS LIST:" + list);
		model.addAttribute("list", list);
		return "students/list";
	}

	// 게시물 작성 폼
	@GetMapping("/write")
	public String writeForm() {
		return "students/writeForm";
	}

	@PostMapping("/write")
	public String writeAction(@ModelAttribute StudentsVo studentsVo) {
		logger.debug("STUDENTS WRITE:" + studentsVo);
		boolean success = studentsServiceImpl.insertStudents(studentsVo);

		if (success) {
			return "redirect:/students/list";
		} else {
			return "redirect:/write";
		}
	}

	// 게시물 수정 폼
	@GetMapping("/modify/{no}")
	public String modifyForm(@PathVariable("no") Integer no, Model model) {
		// 기존 게시물 가져오기
		StudentsVo studentsVo = studentsServiceImpl.selectStudents(no);
		model.addAttribute("vo", studentsVo);
		return "students/modifyForm";
	}

	// 게시물 수정
	@PostMapping("/modify")
	public String modifyAction(@ModelAttribute StudentsVo studentsVo) {
		logger.debug("STUDENTS MODIFY:" + studentsVo);
		boolean success = studentsServiceImpl.updateStudents(studentsVo);

		if (success) {
			return "redirect:/students/list";
		} else {
			return "redirect:/modify/" + studentsVo.getNo();
		}
	}

	// 게시물 삭제
	@GetMapping("/delete/{no}")
	public String deleteAction(@PathVariable("no") Integer no) {
		logger.debug("STUDENTS DELETE:" + no);
		studentsServiceImpl.deleteStudents(no);
		return "redirect:/students/list";
	}
}