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
import org.springframework.web.bind.annotation.ResponseBody;

import com.thirdproject.repository.vo.CounselingLogVo;
import com.thirdproject.repository.vo.StudentsVo;
import com.thirdproject.service.CounselingLogService;

@Controller
@RequestMapping("/counseling")
public class CounselingLogController {
    private static final Logger logger = LoggerFactory.getLogger(CounselingLogController.class);

    @Autowired
    private CounselingLogService counselingLogServiceImpl;

    @GetMapping({"/", ""})
    public String mainPage() {
        return "students/main";
    }

    @GetMapping("/list")
    public String list(
            @RequestParam(name = "page", defaultValue = "1") int currentPage,
            @RequestParam(value = "studentNo", required = false) Integer studentNo,
            Model model) {

        int itemsPerPage = 5; // 페이지당 항목 수
        int totalItems = (studentNo == null) ? counselingLogServiceImpl.getTotalCounselingLogs() : counselingLogServiceImpl.getTotalCounselingLogsByStudent(studentNo);
        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

        int startRow = (currentPage - 1) * itemsPerPage;
        List<CounselingLogVo> list;

        if (studentNo != null) {
            list = counselingLogServiceImpl.selectCounselingLogListByStudentPaged(studentNo, startRow, itemsPerPage);
        } else {
            list = counselingLogServiceImpl.selectCounselingLogListPaged(startRow, itemsPerPage);
        }

        logger.debug("COUNSELINGLOG LIST:" + list);
        model.addAttribute("list", list);

        List<StudentsVo> studentList = counselingLogServiceImpl.getAllStudents();
        model.addAttribute("studentList", studentList);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);

        return "counseling/loglist";
    }

    // 리스트 작성 폼
    @GetMapping("/write")
    public String writeForm() {
        return "counseling/writeForm";
    }

    @PostMapping("/write")
    public String writeAction(@ModelAttribute CounselingLogVo counselingLogVo) {
        logger.debug("COUNSELINGLOG WRITE:" + counselingLogVo);
        boolean success = counselingLogServiceImpl.insertCounselingLog(counselingLogVo);

        if (success) {
            return "redirect:/counseling/list";
        } else {
            return "redirect:/counseling/write";
        }
    }

    // 리스트 수정 폼 
    @GetMapping("/modify/{no}")
    public String modifyForm(@PathVariable("no") Integer no, Model model) {
        CounselingLogVo counselingLogVo = counselingLogServiceImpl.selectCounselingLog(no);
        model.addAttribute("vo", counselingLogVo);
        return "counseling/modifyForm";
    }

    @PostMapping("/modify")
    public String modifyAction(@ModelAttribute CounselingLogVo counselingLogVo) {
        logger.debug("COUNSELINGLOG MODIFY:" + counselingLogVo);
        boolean success = counselingLogServiceImpl.updateCounselingLog(counselingLogVo);

        if (success) {
            return "redirect:/counseling/list";
        } else {
            return "redirect:/counseling/modify/" + counselingLogVo.getNo(); // 수정된 부분
        }
    }

    // 리스트 삭제 
    @GetMapping("/delete/{no}")
    public String deleteAction(@PathVariable("no") Integer no) {
        logger.debug("COUNSELINGLOG DELETE:" + no);
        counselingLogServiceImpl.deleteCounselingLog(no);
        return "redirect:/counseling/list";
    }

    @GetMapping("/getStudentNumbersByName")
    @ResponseBody
    public List<StudentsVo> getStudentNumbersByName(@RequestParam("studentName") String studentName) {
        return counselingLogServiceImpl.getStudentNumbersByName(studentName);
    }
}