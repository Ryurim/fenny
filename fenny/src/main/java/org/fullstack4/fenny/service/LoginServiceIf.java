package org.fullstack4.fenny.service;

import org.fullstack4.fenny.dto.MemberDTO;

public interface LoginServiceIf {
    MemberDTO view(String member_id);
    MemberDTO login_info(String member_id, String member_pwd);
    int updateLoginTry(String member_id);
    int resetLoginTry(String member_id);
    int findPwd(String member_id);
    int modifyPwd(String member_id, String member_pwd, String new_pwd);
}
