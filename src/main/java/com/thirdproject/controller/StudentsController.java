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
import org.springframework.web.bind.annotation.RequestParam;

import com.thirdproject.repository.vo.CounselingLogVo;
import com.thirdproject.repository.vo.StudentsVo;
import com.thirdproject.repository.vo.UserVo;
import com.thirdproject.service.CounselingLogService;
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
    
    @Autowired
    private CounselingLogService counselingLogServiceImpl; // CounselingLogService 주입

    @GetMapping({"/", ""})
    public String mainPage(Model model) {
    	// 최근 등록 학생 3명 조회
    	List<StudentsVo> list = studentsServiceImpl.selectStudentsList();
        if (list.size() > 3) {
            list = list.subList(0, 3); // 최근 3개의 데이터만 선택
        }
        model.addAttribute("list", list);
        
        // 최근 등록 상담 로그 3개 조회
        List<CounselingLogVo> list2 = counselingLogServiceImpl.selectCounselingLogList();
        if (list2.size() > 3) {
            list2 = list2.subList(0, 3); // 최근 3개의 데이터만 선택
        }
        model.addAttribute("list2", list2);
        
        // 등록된 사용자 정보 조회
        List<UserVo> list3 = userServiceImpl.selectUserList();
        model.addAttribute("list3", list3);       
        
        // 전체 학생 수와 전체 선생님 수 가져오기
        int totalStudents = studentsServiceImpl.getTotalStudents();
        int totalTeachers = studentsServiceImpl.getTotalTeachers();

        // 모델에 데이터 추가
        model.addAttribute("totalStudents", totalStudents);
        model.addAttribute("totalTeachers", totalTeachers);
    	
        return "students/firstPage";
    }

    @GetMapping("/list")
    public String list(@RequestParam(value = "searchKeyword", required = false) String searchKeyword, Model model) {
        List<StudentsVo> list;
        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            list = studentsServiceImpl.searchStudents(searchKeyword);
        } else {
            list = studentsServiceImpl.selectStudentsList();
        }
        logger.debug("STUDENTS LIST:" + list);
        
        model.addAttribute("list", list);
        model.addAttribute("searchKeyword", searchKeyword); // 검색 키워드 유지
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
    public String writeAction(@ModelAttribute StudentsVo studentsVo, Model model) {
        logger.debug("STUDENTS WRITE:" + studentsVo);

     // 학생 연락처 중복 검증
        if (studentsServiceImpl.isStudentCellphoneDuplicate(studentsVo.getStudentCellphone())) {
            model.addAttribute("errorMessage", "중복된 학생 연락처입니다!");
            
            List<UserVo> users = userServiceImpl.selectUserList();
            model.addAttribute("users", users);
            model.addAttribute("studentsVo", studentsVo); // 입력 데이터 모델에 추가
            return "students/writeForm"; // 중복 시 등록 폼으로 다시 이동
        }

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
    public String modifyAction(@ModelAttribute StudentsVo studentsVo, Model model) {
        logger.debug("STUDENTS MODIFY:" + studentsVo);

        // 학생 연락처 중복 검증
        if (studentsServiceImpl.isStudentCellphoneDuplicateForUpdate(studentsVo.getStudentCellphone(), studentsVo.getNo())) {
            model.addAttribute("errorMessage", "중복된 학생 연락처입니다!");
            model.addAttribute("vo", studentsVo); // 수정 폼에 기존 데이터 유지
            List<UserVo> users = userServiceImpl.selectUserList();
            model.addAttribute("users", users);
            return "students/modifyForm"; // 중복 시 수정 폼으로 다시 이동
        }

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