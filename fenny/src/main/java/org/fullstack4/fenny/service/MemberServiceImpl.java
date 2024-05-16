package org.fullstack4.fenny.service;

import lombok.RequiredArgsConstructor;
import org.fullstack4.fenny.domain.MemberVO;
import org.fullstack4.fenny.dto.MemberDTO;
import org.fullstack4.fenny.mapper.MemberMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.lang.reflect.Member;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberServiceIf{

    private final MemberMapper memberMapper;
    private final ModelMapper modelMapper;

    @Override
    public int regist(MemberDTO memberDTO, String check_pwd) {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        if (!memberVO.getMember_pwd().equals(check_pwd)) {
            return 100;
        } else {
            return memberMapper.regist(memberVO);
        }
    }

    @Override
    public MemberDTO view(String member_id) {
        MemberVO memberVO = memberMapper.view(member_id);
        MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        return memberDTO;
    }

    @Override
    public int modify(MemberDTO memberDTO, String check_pwd) {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        if (!check_pwd.equals("") && !memberVO.getMember_pwd().equals(check_pwd)) {
            return 100;
        } else {
            return memberMapper.modify(memberVO);
        }
    }

    @Override
    public int checkId(String member_id) {
        return memberMapper.checkId(member_id);
    }

    @Override
    public int checkEmail(String member_email) {
        return memberMapper.checkEmail(member_email);
    }
}
