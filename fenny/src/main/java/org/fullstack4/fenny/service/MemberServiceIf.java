package org.fullstack4.fenny.service;

import org.fullstack4.fenny.domain.MemberVO;
import org.fullstack4.fenny.dto.MemberDTO;

public interface MemberServiceIf {
    int regist(MemberDTO memberDTO, String check_pwd);
    MemberDTO view(String member_id);
    int modify(MemberDTO memberDTO, String check_pwd);
    int checkId(String member_id);
    int checkEmail(String member_email);
}
