package org.fullstack4.fenny.controller.member;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.fenny.dto.MemberDTO;
import org.fullstack4.fenny.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberServiceIf memberServiceIf;

    @GetMapping("/regist")
    public void registGET() {

    }

    @PostMapping("/regist")
    public String registPOST(@Valid MemberDTO memberDTO,
                             BindingResult bindingResult,
                             @RequestParam String check_pwd,
                             RedirectAttributes redirectAttributes,
                             Model model) {

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/member/regist";
        }

        int result = memberServiceIf.regist(memberDTO, check_pwd);
        if (result == 100) {
            redirectAttributes.addFlashAttribute("error", "비밀번호 확인을 정확하게 입력해 주세요.");
            return "redirect:/member/regist";
        }

        else if (result == 1) {

            return "redirect:/login/login";
        }

        else return "redirect:/member/regist";
    }

    @GetMapping("/view")
    public void viewGET(HttpSession session, Model model) {
        MemberDTO memberDTO = memberServiceIf.view(String.valueOf(session.getAttribute("member_id")));
        model.addAttribute("memberDTO", memberDTO);
    }

    @GetMapping("/modify")
    public void modifyGET(HttpSession session,  Model model) {
        MemberDTO memberDTO = memberServiceIf.view(String.valueOf(session.getAttribute("member_id")));
        model.addAttribute("memberDTO", memberDTO);
    }

    @PostMapping("/modify")
    public String modifyPOST(@Valid MemberDTO memberDTO, BindingResult bindingResult,
                             @RequestParam(name="check_pwd", defaultValue = "") String check_pwd,
                             @RequestParam(name="modify_pwd", defaultValue = "") String modify_pwd,
                             RedirectAttributes redirectAttributes,
                             Model model) {

        log.info("memberDTO : {}", memberDTO);
        log.info("modify_pwd : {}", modify_pwd);

        if (modify_pwd != null || modify_pwd.isEmpty()) {
            memberDTO.setMember_pwd(modify_pwd);
        }

        log.info("memberDTO : {}", memberDTO);

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);
            return "redirect:/member/modify";
        }

        int result = memberServiceIf.modify(memberDTO, check_pwd);
        if (result == 100) {
            redirectAttributes.addFlashAttribute("error", "비밀번호 확인을 정확하게 입력해 주세요.");
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);
            return "redirect:/member/modify";
        }

        else if (result == 1) {

            return "redirect:/member/view";
        }

        else {
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);
            return "redirect:/member/modify";
        }
    }

    @RequestMapping(value = "/checkId", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String checkIdPOST(@RequestParam String member_id, Model model) {
        String result = String.valueOf(memberServiceIf.checkId(member_id));
        return result;
    }

    @RequestMapping(value = "/checkEmail", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String checkEmailPOST(@RequestParam String member_email, Model model) {
        String result = String.valueOf(memberServiceIf.checkEmail(member_email));
        return result;
    }
}
