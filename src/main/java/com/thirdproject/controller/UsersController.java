package com.thirdproject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thirdproject.repository.vo.UserVo;
import com.thirdproject.service.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/users")
public class UsersController {
    private static final Logger logger = LoggerFactory.getLogger(UsersController.class);

    @Autowired
    UserService userServiceImpl;

    @GetMapping("/join" )
    public String joinForm(@ModelAttribute UserVo userVo) {
        return "users/joinform";
    }

    @GetMapping("/joinsuccess")
    public String joinSuccess(HttpSession session, Model model) {
        // 세션에서 성공 메시지 삭제 (새로고침 시 alert이 다시 뜨는 것을 방지)
        String successMessage = (String) session.getAttribute("successMessage");
        session.removeAttribute("successMessage");

        // 성공 메시지가 있다면 모델에 추가
        if (successMessage != null && !successMessage.isEmpty()) {
            model.addAttribute("successMessage", successMessage);
        }

        return "users/joinsuccess";
    }

    @PostMapping("/join")
    public String joinAction(@ModelAttribute @Valid UserVo userVo, BindingResult result, Model model, HttpSession session) {
        logger.debug("회원 가입 액션");
        logger.debug("회원 가입 정보:" + userVo);

        // 모든 필드 입력 검증 (가장 먼저 수행)
        if (userVo.getId().isEmpty() || userVo.getPw().isEmpty() || userVo.getName().isEmpty()
                || userVo.getCellPhone().isEmpty()) {
            model.addAttribute("emptyFieldsError", "모든 필드를 채워주세요.");
            return "users/joinform";
        }

        if (result.hasErrors()) {
            List<ObjectError> list = result.getAllErrors();
            for (ObjectError e : list) {
                logger.error("검증 에러:" + e);
            }
            model.addAllAttributes(result.getModel());
            return "users/joinform";
        }

        // 중복 검증
        if (userServiceImpl.getUser(userVo.getId()) != null) {
            model.addAttribute("idError", "중복된 아이디입니다.");
            return "users/joinform";
        }

        // 연락처 중복 검증
        if (userServiceImpl.getUserByCellPhone(userVo.getCellPhone()) != null) {
            model.addAttribute("cellPhoneError", "중복된 연락처입니다.");
            return "users/joinform";
        }

        boolean success = userServiceImpl.join(userVo);

        if (!success) {
            System.err.println("회원가입 실패!");
            return "redirect:/users/join";
        } else {
            System.out.println("회원가입 성공!");
            // 세션에 성공 메시지 저장
            session.setAttribute("successMessage", "회원가입이 완료되었습니다.");
            return "redirect:/users/joinsuccess";
        }
    }

    @GetMapping({"", "/", "/login"})
    public String loginForm() {
        return "users/loginform";
    }

    @PostMapping("/login")
    public String loginAction(@RequestParam(value = "id", required = false) String id,
            @RequestParam(value = "pw", required = false) String pw, HttpSession session, Model model) {
        if (id == null || id.isEmpty() || pw == null || pw.isEmpty()) {
            model.addAttribute("loginError", "아이디 또는 비밀번호를 입력해주세요.");
            return "users/loginform";
        }

        UserVo authUser = userServiceImpl.getUser(id, pw);

        if (authUser != null) {
            session.setAttribute("authUser", authUser);
            return "redirect:/students/";
        } else {
            model.addAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "users/loginform";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/users/login"; // 홈페이지로 리다이렉트
    }

    @ResponseBody
    @GetMapping("/checkId")
    // JSON API
    public Object exists(@RequestParam(value = "id", required = false, defaultValue = "") String id) {
        // { "result": "success", "data": true }
        UserVo vo = userServiceImpl.getUser(id);
        boolean exists = vo != null ? true : false;

        Map<String, Object> map = new HashMap<>();
        map.put("result", "success");
        map.put("exists", exists);

        return map;
    }
}