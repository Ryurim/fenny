package org.fullstack4.fenny.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.fenny.domain.MemberVO;
import org.fullstack4.fenny.dto.MemberDTO;
import org.fullstack4.fenny.mapper.LoginMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginServiceIf{

    private final ModelMapper modelMapper;
    private final LoginMapper loginMapper;

    @Override
    public MemberDTO view(String member_id) {
        MemberVO memberVO = null;
        if (member_id != null && !member_id.isEmpty()) {
            memberVO = loginMapper.view(member_id);
        }
        MemberDTO memberDTO = null;
        if (memberVO != null) {
            memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        }

        return memberDTO;
    }

    @Override
    public MemberDTO login_info(String member_id, String member_pwd) {
        MemberVO memberVO = null;
        if (member_id != null && !member_id.isEmpty() && member_pwd != null && !member_pwd.isEmpty()) {
            memberVO = loginMapper.login_info(member_id);
        }
        MemberDTO memberDTO = null;
        if (memberVO != null && memberVO.getMember_pwd().equals(member_pwd)) {
            memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        }

        return memberDTO;
    }

    @Override
    public int updateLoginTry(String member_id) {
        return loginMapper.updateLoginTry(member_id);
    }

    @Override
    public int resetLoginTry(String member_id) {
        return loginMapper.resetLoginTry(member_id);
    }

    @Override
    public int findPwd(String member_id) {
        return loginMapper.findPwd(member_id);
    }

    @Override
    public int modifyPwd(String member_id, String member_pwd, String new_pwd) {
        MemberVO memberVO = loginMapper.view(member_id);
        MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        int result = 0;
        if (memberDTO.getMember_pwd().equals(member_pwd)) {
            result = loginMapper.modifyPwd(member_id, new_pwd);
        }
        return result;
    }
}
