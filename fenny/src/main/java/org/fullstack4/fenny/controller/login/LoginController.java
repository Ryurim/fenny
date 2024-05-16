package org.fullstack4.fenny.controller.login;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.fenny.common.CookieUtil;
import org.fullstack4.fenny.dto.LoginDTO;
import org.fullstack4.fenny.dto.MemberDTO;
import org.fullstack4.fenny.service.LoginServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/login")
public class LoginController {
    private final LoginServiceIf loginService;

    @GetMapping("/login")
    public void loginGET() {
        log.info("LoginController >> loginGET");
    }


    @PostMapping("/login")
    public String loginPOST(@Valid LoginDTO loginDTO,
                            BindingResult bindingResult,
            @RequestParam(name="save_id", defaultValue = "N") String save_id,
            RedirectAttributes redirectAttributes,
            HttpSession session,
            HttpServletResponse resp,
            HttpServletRequest req,
            Model model) {

        log.info("LoginController >> loginPOST");

        if (bindingResult.hasErrors()) {
            log.info("LoginController >> errors 반환");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/login/login";
        }


        log.info("loginDTO : {}", loginDTO);


        MemberDTO memberDTO = loginService.view(loginDTO.getMember_id());
        log.info("LoginController >> memberDTO : {}", memberDTO);

        if (memberDTO != null) {
            if (memberDTO.getMember_login_try() >= 5 ) {
                log.info("LoginController >> 로그인 시도 5회 이상 또는 멤버 LOCK 상태");
                log.info("memberDTO : {}", memberDTO);
                redirectAttributes.addFlashAttribute("error", "5회 이상 로그인 실패로 잠금 처리된 아이디입니다.\\n관리자에게 문의해 주세요");
//                model.addAttribute("loginLock", "disabled");
                return "redirect:/login/login";
            }
            if (memberDTO.getMember_lock().equals("Y")) {
                log.info("LoginController >> 멤버 LOCK 상태");
                log.info("memberDTO : {}", memberDTO);
                redirectAttributes.addFlashAttribute("error", "관리자 또는 이용 규칙 위반에 의해 이용이 제한된 아이디입니다.\\n관리자에게 문의해 주세요.");
                return "redirect:/login/login";
            }
            if (memberDTO.getMember_login_lock().equals("Y")) {
                log.info("LoginController >> 로그인 이력 6개월 이상");
                log.info("memberDTO : {}", memberDTO);
                redirectAttributes.addFlashAttribute("error", "6개월 이상 로그인 이력이 없습니다.\\n관리자에게 문의해 주세요");
                return "redirect:/login/login";
            }

            if (bindingResult.hasErrors()) {
                log.info("LoginController >> errors 반환");
                redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
                return "redirect:/login/login";
            }

            MemberDTO loginMemberDTO = loginService.login_info(loginDTO.getMember_id(), loginDTO.getMember_pwd());


            if (loginMemberDTO != null) {

                log.info("LoginController >> 로그인 성공");
                loginService.resetLoginTry(loginMemberDTO.getMember_id());
                session.setAttribute("member_id", loginMemberDTO.getMember_id());
                model.addAttribute("member_id", loginMemberDTO.getMember_id());

                if (save_id != null && save_id.equals("Y")) {
                    CookieUtil.setCookies(resp, "", "/", 60 * 60 * 24, "member_id", loginMemberDTO.getMember_id());
                    CookieUtil.setCookies(resp, "", "/", 60 * 60 * 24, "save_check", "checked");
                }

                if (save_id != null && save_id.equals("N")) {
                    CookieUtil.setDeleteCookie(resp, "", "/", 0, "member_id", loginMemberDTO.getMember_id());
                    CookieUtil.setDeleteCookie(resp, "", "/", 0, "save_check", "checked");
                }

                return "redirect:/";
            }
            else {
                log.info("LoginController >> 로그인 실패 - 로그인일치 실패");
                if (!memberDTO.getMember_id().isEmpty()) {
                    loginService.updateLoginTry(memberDTO.getMember_id());
                }
                redirectAttributes.addFlashAttribute("error", "사용자 정보가 일치하지 않습니다.");
                return "redirect:/login/login";
            }
        }

        else {
            log.info("LoginController >> 로그인 실패 - 조회실패");

            redirectAttributes.addFlashAttribute("error", "없는 아이디입니다.");
            return "redirect:/login/login";
        }
    }



    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        log.info("LoginController >> logoutGET");
        return "redirect:/";
    }

    @GetMapping("/findPwd")
    public void findPwdGET(Model model) {

    }

    @PostMapping("/findPwd")
    public String findPwdPOST(@RequestParam(name="member_id", defaultValue = "") String member_id,
                              RedirectAttributes redirectAttributes) {

        if (member_id.isEmpty() || member_id == null) {
            redirectAttributes.addFlashAttribute("error", "아이디를 입력해 주세요.");
            return "redirect:/login/findPwd";
        }

        int result = loginService.findPwd(member_id);

        if (result > 0) {
            MemberDTO memberDTO = loginService.view(member_id);
            redirectAttributes.addAttribute("member_id", member_id);
            redirectAttributes.addFlashAttribute("error", "임시 비밀번호로 변경되었습니다. 비밀번호를 변경해 주세요.");
            log.info("findPwd 임시 비밀번호 : {}", memberDTO.getMember_pwd());
            return "redirect:/login/modifyPwd";
        }
        else {
            redirectAttributes.addFlashAttribute("error", "일치하는 아이디가 없습니다.");
            return "redirect:/login/findPwd";
        }
    }

    @GetMapping("/modifyPwd")
    public void modifyPwdGET(@RequestParam String member_id, Model model) {

        model.addAttribute("member_id", member_id);
    }

    @PostMapping("/modifyPwd")
    public String modifyPwdPOST(@Valid LoginDTO loginDTO,
                                BindingResult bindingResult,
                                @RequestParam(name="new_pwd", defaultValue = "") String new_pwd,
                                RedirectAttributes redirectAttributes,
                                Model model
                                ) {

        log.info("modifyPWD");
        log.info("loginDTO : {}", loginDTO);

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/login/modifyPwd?member_id=" + loginDTO.getMember_id();
        }

        if (new_pwd == null || new_pwd.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "새로운 비밀번호를 입력하세요.");
            return "redirect:/login/modifyPwd?member_id=" + loginDTO.getMember_id();
        }

        int result = loginService.modifyPwd(loginDTO.getMember_id(), loginDTO.getMember_pwd(), new_pwd);
        if (result > 0) {
            redirectAttributes.addFlashAttribute("error", "비밀번호가 정상적으로 변경 되었습니다.");
            return "redirect:/login/login";
        }
        else {
            redirectAttributes.addFlashAttribute("error", "사용자 정보가 올바르지 않습니다.");
            return "redirect:/login/modifyPwd?member_id=" + loginDTO.getMember_id();
        }
    }

}
