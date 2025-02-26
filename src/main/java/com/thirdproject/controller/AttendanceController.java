package com.thirdproject.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thirdproject.repository.vo.AttendanceVo;
import com.thirdproject.repository.vo.UserVo;
import com.thirdproject.service.AttendanceService;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {

    @Autowired
    private AttendanceService attendanceService;

    @GetMapping("/list")
    public String attendanceList(@RequestParam(value = "teacherNo", required = false) Integer teacherNo, Model model) {
        List<AttendanceVo> list;
        if (teacherNo != null) {
            list = attendanceService.getAttendancesByTeacher(teacherNo);
        } else {
            list = attendanceService.getAllAttendances();
        }
        model.addAttribute("list", list);

        List<UserVo> teacherList = attendanceService.getAllTeachers();
        model.addAttribute("teacherList", teacherList);

        return "attendance/list";
    }
    

    @PostMapping("/save")
    public String saveAttendance(@RequestParam(value = "studentNo", required = false) Integer studentNo,
                                 @RequestParam("attendanceDate") String attendanceDate,
                                 @RequestParam("attendanceStatus") String attendanceStatus) {

        System.out.println("studentNo: " + studentNo);
        System.out.println("attendanceDate: " + attendanceDate);
        System.out.println("attendanceStatus: " + attendanceStatus);

        if (studentNo == null || attendanceDate == null || attendanceDate.isEmpty()) {
            return "redirect:/attendance/list";
        }

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        final Date sqlDate; // final로 선언
        try {
            java.util.Date parsedDate = dateFormat.parse(attendanceDate);
            sqlDate = new Date(parsedDate.getTime());
        } catch (ParseException e) {
            return "redirect:/attendance/list";
        }

        AttendanceVo attendanceVo = new AttendanceVo();
        attendanceVo.setStudentNo(studentNo);
        attendanceVo.setAttendanceDate(sqlDate);
        attendanceVo.setAttendanceStatus(attendanceStatus);

     // 출석 정보가 이미 존재하는지 확인
        AttendanceVo existingAttendance = attendanceService.getAttendance(studentNo, sqlDate);

        if (existingAttendance != null) {
            attendanceService.updateAttendance(attendanceVo);
        } else {
            attendanceService.saveAttendance(attendanceVo);
        }

        return "redirect:/attendance/list";
    }
}