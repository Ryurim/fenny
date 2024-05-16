package org.fullstack4.fenny.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.fenny.dto.MemberDTO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class LoginServiceTests {
    @Autowired(required=false)
    private LoginServiceIf loginServiceIf;

    @Test
    public void testLoginInfo() {
        String member_id = "test";
        String member_pwd = "1234";
        MemberDTO memberDTO = loginServiceIf.login_info(member_id, member_pwd);
        log.info("testLoginInfo >> memberDTO : {}", memberDTO);
    }

    @Test
    public void testUpdateLoginTry() {
        String member_id = "test";
        int result = loginServiceIf.updateLoginTry(member_id);
        log.info("testUpdateLoginTry >> result : {}", result);
    }

    @Test
    public void testModifyPwd() {
        String member_id = "test2";

        MemberDTO memberDTO =loginServiceIf.view(member_id);

        String member_pwd = memberDTO.getMember_pwd();
        String new_pwd = "1234";

        int result = loginServiceIf.modifyPwd(member_id, member_pwd, new_pwd);
        log.info("testModifyPwd >> result : {}", result);
    }
}
