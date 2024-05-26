package org.fullstack4.fenny.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.fenny.domain.MemberVO;
import org.fullstack4.fenny.domain.StudyDetailVO;
import org.fullstack4.fenny.domain.StudyVO;
import org.fullstack4.fenny.dto.*;
import org.fullstack4.fenny.mapper.StudyMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class StudyServiceImpl implements StudyServiceIf{
    private final StudyMapper studyMapper;
    private final ModelMapper modelMapper;

    @Override
    public int registStudy(StudyDTO studyDTO) {
        StudyVO studyVO = modelMapper.map(studyDTO, StudyVO.class);
        int result = studyMapper.registStudy(studyVO);
        return result;
    }

    @Override
    public StudyDTO viewStudy(int study_idx) {
        StudyVO studyVO = studyMapper.viewStudy(study_idx);
        StudyDTO studyDTO = null;
        if(studyVO != null) {
            studyDTO = modelMapper.map(studyVO, StudyDTO.class);
        }
        return studyDTO;
    }

    @Override
    public int modifyStudy(StudyDTO studyDTO) {
        StudyVO studyVO = modelMapper.map(studyDTO, StudyVO.class);
        int result = studyMapper.modifyStudy(studyVO);
        return result;
    }

    @Override
    public int shareStudy(StudyDetailDTO studyDetailDTO) {
        StudyDetailVO studyDetailVO = modelMapper.map(studyDetailDTO, StudyDetailVO.class);
        int result = studyMapper.shareStudy(studyDetailVO);
        return result;
    }

    @Override
    public int deleteStudy(int study_idx) {
        return studyMapper.deleteStudy(study_idx);
    }


    @Override
    public PageResponseDTO<StudyDTO> getStudy(PageRequestDTO pageRequestDTO) {
        List<StudyDTO> studyDTOList = studyMapper.getStudy(pageRequestDTO).stream()
                .map(vo->modelMapper.map(vo, StudyDTO.class))
                .collect(Collectors.toList());

        int total_count = studyMapper.totalStudy(pageRequestDTO);

        log.info("impl studyList : {}", studyDTOList);
        PageResponseDTO<StudyDTO> responseDTO = PageResponseDTO.<StudyDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(studyDTOList)
                .total_count(total_count)
                .build();
        return responseDTO;
    }

    @Override
    public int updateLike(int study_idx) {
        return studyMapper.updateLike(study_idx);
    }

    @Override
    public int likeMember(StudyLikeDTO studyLikeDTO) {
        return 0;
    }

    //공유할 회원 조회
    @Override
    public List<MemberDTO> shareId(String member_id) {
        List<MemberDTO> memberDTOList = studyMapper.shareId(member_id).stream()
                .map(vo->modelMapper.map(vo, MemberDTO.class))
                .collect(Collectors.toList());

        return memberDTOList;
    }

    @Override
    public PageResponseDTO<StudyDTO> getShare(PageRequestDTO pageRequestDTO) {
        List<StudyDTO> studyDTOList = studyMapper.getShare(pageRequestDTO);

        int total_count = studyMapper.totalShare(pageRequestDTO);



        log.info("impl studyList : {}", studyDTOList);
        PageResponseDTO<StudyDTO> responseDTO = PageResponseDTO.<StudyDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(studyDTOList)
                .total_count(total_count)
                .build();
        return responseDTO;
    }

    @Override
    public int deleteShare1(int study_idx) {
        return studyMapper.deleteShare1(study_idx);
    }

    @Override
    public int shareId(StudyShareDTO studyShareDTO) {
        return studyMapper.shareID(studyShareDTO);
    }

    @Override
    public List<StudyShareDTO> getShareId(int study_idx) {
        List<StudyShareDTO> list = studyMapper.getShareID(study_idx);
        return list;
    }

    @Override
    public int deleteShare(StudyShareDTO studyShareDTO) {
        return studyMapper.deleteShare(studyShareDTO);
    }

    @Override
    public PageResponseDTO<StudyDTO> getShare2(PageRequestDTO pageRequestDTO) {
        List<StudyDTO> studyDTOList = studyMapper.getShare2(pageRequestDTO);
        log.info(studyDTOList);

        int total_count = studyMapper.totalShare2(pageRequestDTO);


        log.info("impl studyList : {}", studyDTOList);
        PageResponseDTO<StudyDTO> responseDTO = PageResponseDTO.<StudyDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(studyDTOList)
                .total_count(total_count)
                .build();
        return responseDTO;
    }
}
