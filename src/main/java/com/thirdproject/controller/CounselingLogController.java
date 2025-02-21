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

import com.thirdproject.repository.vo.CounselingLogVo;
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
    public String list(Model model) {
        List<CounselingLogVo> list = counselingLogServiceImpl.selectCounselingLogList();
        logger.debug("COUNSELINGLOG LIST:" + list);
        model.addAttribute("list", list);
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
}