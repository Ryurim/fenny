package org.fullstack4.fenny.mapper;


import org.fullstack4.fenny.domain.MemberVO;

public interface LoginMapper {
    MemberVO view(String member_id);

    MemberVO login_info(String member_id);

    int updateLoginTry(String member_id);
    int resetLoginTry(String member_id);

    int findPwd(String member_id);
    int modifyPwd(String member_id, String new_pwd);
}
