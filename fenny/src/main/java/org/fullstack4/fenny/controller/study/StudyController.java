package org.fullstack4.fenny.controller.study;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.fenny.common.FileUtil;
import org.fullstack4.fenny.dto.MemberDTO;
import org.fullstack4.fenny.dto.PageRequestDTO;
import org.fullstack4.fenny.dto.PageResponseDTO;
import org.fullstack4.fenny.dto.StudyDTO;
import org.fullstack4.fenny.service.StudyServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
public class StudyController {
    private final StudyServiceIf studyService;

    @GetMapping("/")
    public void main() {

    }

    @GetMapping("/my/main")
    public void myMain(HttpSession session,
                       @Valid PageRequestDTO pageRequestDTO,
                       @RequestParam(name = "sortMethod", defaultValue = "") String sortMethod,
                       Model model) {
        log.info("My Main");
        pageRequestDTO.setMember_id(String.valueOf(session.getAttribute("member_id")));
        String sortField = "study_reg_date";
        String sortDir = "desc";

        log.info("sortMethod :"+sortMethod);
        if(sortMethod != null && !sortMethod.isEmpty()) {
            sortField = sortMethod.substring(0, sortMethod.indexOf("||"));
            sortDir = sortMethod.substring(sortMethod.indexOf("||")).replace("||", "");
        }

        // 정렬 정보를 PageRequestDTO에 설정
        pageRequestDTO.setSortField(sortField);
        pageRequestDTO.setSortDir(sortDir);

        log.info("sortField1111 :"+ sortField);
        log.info("sortDir111111 :"+ sortDir);

        log.info("pageRequestDTO : {}", pageRequestDTO);
        PageResponseDTO<StudyDTO> studyList = studyService.getStudy(pageRequestDTO);
        log.info("studyList : {}", studyList);
        model.addAttribute("qnaList", studyList);
    }

    @GetMapping("/my/regist")
    public void myRegistGET(HttpSession session,
                            Model model) {
        List<MemberDTO> memberDTOList = studyService.shareId(String.valueOf(session.getAttribute("member_id")));
        model.addAttribute("memberDTOList", memberDTOList);
    }

    @PostMapping("/my/regist")
    public String myRegistPOST(@Valid StudyDTO studyDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes,
                               @RequestParam(name="upload") MultipartFile file,
                               HttpServletRequest req,
                               HttpSession session,
                               Model model) throws ServletException, IOException {
        log.info("registPOST");
        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            log.info(bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("studyDTO", studyDTO);

            return "redirect:/my/regist";
        }


        int result = 0;
        String study_file = "";
        if(file != null &&  file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty() ){

            log.info("file  : "+file);
            log.info("getOriginalFilename : "+file.getOriginalFilename());

            String org_file = FileUtil.uploadFile(req, "D:\\java4\\BEC\\src\\main\\webapp\\uploads\\img\\study");
            study_file = FileUtil.renameFile("D:\\java4\\BEC\\src\\main\\webapp\\resources\\uploads\\img\\study", org_file);


            log.info("study_file : "+study_file);
        }

        studyDTO.setStudy_image(study_file);
        log.info("regist studyDTO : {}", studyDTO);
        result = studyService.registStudy(studyDTO);


        if (result > 0) {
            return "redirect:/my/main";
        }
        else {
            return "redirect:/my/regist";
        }
    }
    @GetMapping("/my/view")
    public void myViewGET(@RequestParam int study_idx,
                          HttpSession session,
                          Model model) {
        StudyDTO studyDTO = studyService.viewStudy(study_idx);
        model.addAttribute("studyDTO", studyDTO);
    }
    @GetMapping("my/modify")
    public void myModifyGET(@RequestParam int study_idx,
                            HttpSession session,
                            Model model) {
        StudyDTO studyDTO = studyService.viewStudy(study_idx);
        List<MemberDTO> memberDTOList = studyService.shareId(String.valueOf(session.getAttribute("member_id")));
        model.addAttribute("memberDTOList", memberDTOList);
        model.addAttribute("studyDTO", studyDTO);
    }

    @PostMapping("/my/modify")
    public String myModifyPOST(@Valid StudyDTO studyDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes,
                               @RequestParam("upload") MultipartFile file,
                               HttpSession session,
                               Model model) {

        log.info("modifyPOST");
        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("studyDTO", studyDTO);

            return "redirect:/my/modify?study_idx="+studyDTO.getStudy_idx();
        }
        int result = studyService.modifyStudy(studyDTO);
        if (result > 0) {
            return "redirect:/my/view?study_idx=" + studyDTO.getStudy_idx();
        }
        else {
            return "redirect:/my/modify?study_idx=" + studyDTO.getStudy_idx();
        }
    }
    @PostMapping("/my/delete")
    public String myDeleteGET(@RequestParam int study_idx) {
        int result = studyService.deleteStudy(study_idx);
        return "redirect:/my/main";
    }



    @GetMapping("/share/main")
    public void shareMain() {

    }
    @GetMapping("/share/regist")
    public void shareRegistGET() {

    }
    @PostMapping("/share/regist")
    public String shareRegistPOST() {
        return null;
    }
    @GetMapping("/share/view")
    public void shareViewGET() {

    }
    @GetMapping("share/modify")
    public void shareModifyGET() {

    }
    @PostMapping("/share/modify")
    public String shareModifyPOST() {
        return null;
    }
    @PostMapping("/share/delete")
    public String shareDeleteGET() {
        return "redirect:/share/main";
    }
}
