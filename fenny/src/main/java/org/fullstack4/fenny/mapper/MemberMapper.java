package org.fullstack4.fenny.mapper;

import org.fullstack4.fenny.domain.MemberVO;

import java.util.List;

public interface MemberMapper {
    int modifyPwd(String member_id);

    MemberVO view(String member_id);

    int regist(MemberVO memberVO);

    int modify(MemberVO memberVO);

    int checkId(String member_id);
    int checkEmail(String member_email);


}
