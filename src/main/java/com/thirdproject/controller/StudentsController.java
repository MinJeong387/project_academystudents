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
import com.thirdproject.repository.vo.UserVo;
import com.thirdproject.service.StudentsService;
import com.thirdproject.service.UserService;

@Controller
@RequestMapping("/students")
public class StudentsController {
    private static final Logger logger = LoggerFactory.getLogger(StudentsController.class);

    @Autowired
    private StudentsService studentsServiceImpl;
    
    @Autowired
    private UserService userServiceImpl; // UserService 주입

    @GetMapping({"/", ""})
    public String mainPage() {
        return "students/main";
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<StudentsVo> list = studentsServiceImpl.selectStudentsList();
        logger.debug("STUDENTS LIST:" + list);
        model.addAttribute("list", list);
        return "students/list";
    }

    // 리스트 작성 폼
    @GetMapping("/write")
    public String writeForm(Model model) {
        List<UserVo> users = userServiceImpl.selectUserList();
        model.addAttribute("users", users);
        return "students/writeForm";
    }

    @PostMapping("/write")
    public String writeAction(@ModelAttribute StudentsVo studentsVo) {
        logger.debug("STUDENTS WRITE:" + studentsVo);
        boolean success = studentsServiceImpl.insertStudents(studentsVo);

        if (success) {
            return "redirect:/students/list"; 
        } else {
            return "redirect:/students/write"; 
        }
    }

    // 리스트 수정 폼
    @GetMapping("/modify/{no}")
    public String modifyForm(@PathVariable("no") Integer no, Model model) {
        StudentsVo studentsVo = studentsServiceImpl.selectStudents(no);
        model.addAttribute("vo", studentsVo);

        List<UserVo> users = userServiceImpl.selectUserList(); // users 목록 조회
        model.addAttribute("users", users); // users 목록 모델에 추가

        return "students/modifyForm";
    }

    // 리스트 수정
    @PostMapping("/modify")
    public String modifyAction(@ModelAttribute StudentsVo studentsVo) {
        logger.debug("STUDENTS MODIFY:" + studentsVo);
        boolean success = studentsServiceImpl.updateStudents(studentsVo);

        if (success) {
            return "redirect:/students/list"; // 수정 성공 시 학생 목록 화면으로 리다이렉트
        } else {
            return "redirect:/students/modify/" + studentsVo.getNo(); // 수정 실패 시 수정 폼 화면으로 리다이렉트
        }
    }

    // 리스트 삭제
    @GetMapping("/delete/{no}")
    public String deleteAction(@PathVariable("no") Integer no) {
        logger.debug("STUDENTS DELETE:" + no);
        studentsServiceImpl.deleteStudents(no);
        return "redirect:/students/list";
    }
    
   
    
}