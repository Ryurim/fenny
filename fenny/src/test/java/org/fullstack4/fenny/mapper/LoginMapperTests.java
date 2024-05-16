package org.fullstack4.fenny.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.fenny.domain.MemberVO;
import org.fullstack4.fenny.dto.LoginDTO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class LoginMapperTests {

    @Autowired(required = false)
    private LoginMapper loginMapper;

    @Test
    public void testLoginInfo() {
        MemberVO memberVO = MemberVO.builder()
                .member_id("test")
                .build();
        log.info("testLoginInfo >> memberVO : {}", memberVO);
    }

    @Test
    public void testFindPwd() {
        int result = loginMapper.findPwd("test");
        log.info(result);
    }

    @Test
    public void testModifyPwd() {
        int result = loginMapper.modifyPwd("test2", "r");
        log.info(result);
    }
}
