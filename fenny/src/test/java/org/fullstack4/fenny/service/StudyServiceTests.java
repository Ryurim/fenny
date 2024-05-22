package org.fullstack4.fenny.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.fenny.dto.MemberDTO;
import org.fullstack4.fenny.dto.PageRequestDTO;
import org.fullstack4.fenny.dto.PageResponseDTO;
import org.fullstack4.fenny.dto.StudyDTO;
import org.fullstack4.fenny.mapper.StudyMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class StudyServiceTests {
    @Autowired(required=false)
    private StudyServiceIf studyServiceIf;
    private StudyMapper studyMapper;

    @Test
    public void studyListByPage() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .member_id("test")
                .page(1)
                .page_size(10)
                .sortDir("study_like_count")
                .sortField("asc")
                .build();
        PageResponseDTO<StudyDTO> responseDTO = studyServiceIf.getStudy(pageRequestDTO);

        log.info("===============================================");
        log.info("StudyServiceTests >> studyListByPage START");
        responseDTO.getDtoList().forEach(
                vo->log.info(vo)
        );
        log.info("StudyServiceTests >> studyListByPage END");
        log.info("===============================================");
    }

    @Test
    public void testShareId() {
        String member_id = "test";
        List<MemberDTO> list = studyServiceIf.shareId(member_id);
        log.info("list : {}", list);
    }

    @Test
    public void shareListByPage() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .member_id("test")
                .page(1)
                .page_size(10)
                .sortDir("study_like_count")
                .sortField("asc")
                .build();
        PageResponseDTO<StudyDTO> responseDTO = studyServiceIf.getShare(pageRequestDTO);

        log.info("===============================================");
        log.info("StudyServiceTests >> studyListByPage START");
        responseDTO.getDtoList().forEach(
                vo->log.info(vo)
        );
        log.info("StudyServiceTests >> studyListByPage END");
        log.info("===============================================");
    }

}
