package org.fullstack4.fenny.mapper;

import org.fullstack4.fenny.domain.MemberVO;
import org.fullstack4.fenny.domain.StudyDetailVO;
import org.fullstack4.fenny.domain.StudyLikeVO;
import org.fullstack4.fenny.domain.StudyVO;
import org.fullstack4.fenny.dto.PageRequestDTO;
import org.fullstack4.fenny.dto.StudyShareDTO;

import java.util.List;

public interface StudyMapper {
    int registStudy(StudyVO studyVO);
    StudyVO viewStudy(int study_idx);
    int modifyStudy(StudyVO studyVO);
    int shareStudy(StudyDetailVO studyDetailVO);
    int deleteStudy(int study_idx);
    int totalStudy(PageRequestDTO requestDTO);
    List<StudyVO> getStudy(PageRequestDTO pageRequestDTO);
    int updateLike(int study_idx);
    int likeMember(StudyLikeVO studyLikeVO);
    List<MemberVO> shareId(String member_id);
    List<StudyVO> getShare(PageRequestDTO pageRequestDTO);
    int totalShare(PageRequestDTO requestDTO);
    int deleteShare1(int study_idx);

    int shareID(StudyShareDTO studyShareDTO);
    List<StudyShareDTO> getShareID(int study_idx);
    int deleteShare(StudyShareDTO studyShareDTO);
    List<StudyVO> getShare2(PageRequestDTO pageRequestDTO);
}
