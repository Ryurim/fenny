package org.fullstack4.fenny.service;

import org.fullstack4.fenny.domain.StudyLikeVO;
import org.fullstack4.fenny.domain.StudyVO;
import org.fullstack4.fenny.dto.*;

import java.util.List;

public interface StudyServiceIf {
    int registStudy(StudyDTO studyDTO);
    StudyDTO viewStudy(int study_idx);
    int modifyStudy(StudyDTO studyDTO);
    int shareStudy(StudyDetailDTO studyDetailDTO);
    int deleteStudy(int study_idx);
    PageResponseDTO<StudyDTO> getStudy(PageRequestDTO pageRequestDTO);
    int updateLike(int study_idx);
    int likeMember(StudyLikeDTO studyLikeDTO);
    List<MemberDTO> shareId(String member_id);
    PageResponseDTO<StudyDTO> getShare(PageRequestDTO pageRequestDTO);
    int deleteShare1(int study_idx);
    int shareId(StudyShareDTO studyShareDTO);
    List<StudyShareDTO> getShareId(int study_idx);
    int deleteShare(StudyShareDTO studyShareDTO);
    PageResponseDTO<StudyDTO> getShare2(PageRequestDTO pageRequestDTO);
}
