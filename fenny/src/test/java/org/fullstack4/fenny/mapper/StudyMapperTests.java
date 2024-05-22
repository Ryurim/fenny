package org.fullstack4.fenny.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.fenny.controller.formatter.LocalDateFormatter;
import org.fullstack4.fenny.domain.MemberVO;
import org.fullstack4.fenny.domain.StudyDetailVO;
import org.fullstack4.fenny.domain.StudyVO;
import org.fullstack4.fenny.dto.PageRequestDTO;
import org.fullstack4.fenny.dto.StudyDetailDTO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;


@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class StudyMapperTests {

    @Autowired(required = false)
    private StudyMapper studyMapper;

    @Test
    public void registStudyTest() {

                    StudyVO studyVO = StudyVO.builder()
                            .member_id("test")
                            .study_title("테스트 제목 ")
                            .study_content("테스트 내용 ")
                            .study_display_date_start(LocalDate.parse("2024-05-20"))
                            .study_display_date_end(LocalDate.parse("2024-05-27"))
                            .share_id1("test2")
                            .build();
                    int result = studyMapper.registStudy(studyVO);
           log.info("result : {}", result);
    }

    @Test
    public void viewStudyTest() {
        int study_idx = 1;
        StudyVO studyVO = studyMapper.viewStudy(study_idx);
        log.info("studyVO : {}", studyVO);
    }

    @Test
    public void modifyStudyTest() {
        int study_idx = 1;
        StudyVO studyVO = StudyVO.builder()
                .study_idx(study_idx)
                .study_title("테스트 제목 수정")
                .study_content("테스트 내용 수정")
                .study_display_date_start(LocalDate.parse("2024-05-20"))
                .study_display_date_end(LocalDate.parse("2024-05-27"))
                .study_share("Y")
                .study_hashtag("#나라, #음식")
                .study_category("나라, 음식")
                .build();
        int result = studyMapper.modifyStudy(studyVO);
        log.info("result : {}", result);
        log.info("studyVO : {}", studyVO);
    }

    @Test
    public void shareStudyTest() {
        StudyDetailVO studyDetailVO = StudyDetailVO.builder()
                .study_idx(1)
                .receive_id("test2")
                .build();
        int result = studyMapper.shareStudy(studyDetailVO);
        log.info("result : {}", result);
    }



    @Test
    public void getStudy() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .member_id("test")
                .page(1)
                .page_size(10)
                .sortDir("study_like_count")
                .sortField("asc")
                .build();
        int total_count = studyMapper.totalStudy(pageRequestDTO);
        List<StudyVO> bbsList = studyMapper.getStudy(pageRequestDTO);

        log.info("===============================================");
        log.info("total_count : " + total_count);
        bbsList.forEach(list->log.info(list));
        log.info("===============================================");
    }

    @Test
    public void likeTest() {
        int idx = 1;
        int result = studyMapper.updateLike(idx);
        log.info("result : {}", result);
    }

    @Test
    public void testShareId() {
        String member_id = "test";
        List<MemberVO> list = studyMapper.shareId(member_id);
        log.info(list);
    }

    @Test
    public void getShare() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .member_id("test")
                .page(1)
                .page_size(10)
                .sortDir("study_like_count")
                .sortField("asc")
                .build();
        int total_count = studyMapper.totalShare(pageRequestDTO);
        List<StudyVO> bbsList = studyMapper.getShare(pageRequestDTO);

        log.info("===============================================");
        log.info("total_count : " + total_count);
        bbsList.forEach(list->log.info(list));
        log.info("===============================================");
    }
}
