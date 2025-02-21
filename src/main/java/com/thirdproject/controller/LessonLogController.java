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

import com.thirdproject.repository.vo.LessonLogVo;
import com.thirdproject.service.LessonLogService;

@Controller
@RequestMapping("/lesson")
public class LessonLogController {
    private static final Logger logger = LoggerFactory.getLogger(LessonLogController.class);

    @Autowired
    private LessonLogService lessonLogServiceImpl;

    @GetMapping({"/", ""})
    public String mainPage() {
        return "students/main";
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<LessonLogVo> list = lessonLogServiceImpl.selectLessonLogList();
        logger.debug("LESSONLOG LIST:" + list);
        model.addAttribute("list", list);
        return "lesson/loglist";
    }

    // 리스트 작성 폼
    @GetMapping("/write")
    public String writeForm() {
        return "lesson/writeForm";
    }

    @PostMapping("/write")
    public String writeAction(@ModelAttribute LessonLogVo lessonLogVo) {
        logger.debug("LESSONLOG WRITE:" + lessonLogVo);
        boolean success = lessonLogServiceImpl.insertLessonLog(lessonLogVo);

        if (success) {
            return "redirect:/lesson/list";
        } else {
            return "redirect:/lesson/write";
        }
    }

    // 리스트 수정 폼
    @GetMapping("/modify/{no}")
    public String modifyForm(@PathVariable("no") Integer no, Model model) {
        LessonLogVo lessonLogVo = lessonLogServiceImpl.selectLessonLog(no);
        model.addAttribute("vo", lessonLogVo);
        return "lesson/modifyForm";
    }

    @PostMapping("/modify")
    public String modifyAction(@ModelAttribute LessonLogVo lessonLogVo) {
        logger.debug("LESSONLOG MODIFY:" + lessonLogVo);
        boolean success = lessonLogServiceImpl.updateLessonLog(lessonLogVo);

        if (success) {
            return "redirect:/lesson/list";
        } else {
            return "redirect:/lesson/modify/" + lessonLogVo.getNo(); // 수정된 부분
        }
    }

    // 리스트 삭제
    @GetMapping("/delete/{no}")
    public String deleteAction(@PathVariable("no") Integer no) {
        logger.debug("LESSONLOG DELETE:" + no);
        lessonLogServiceImpl.deleteLessonLog(no);
        return "redirect:/lesson/list";
    }
}