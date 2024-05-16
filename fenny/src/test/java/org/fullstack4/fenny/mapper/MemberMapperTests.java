package org.fullstack4.fenny.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.fenny.domain.MemberVO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class MemberMapperTests {

    @Autowired(required = false)
    private MemberMapper memberMapper;

    @Test
    public void testCheckId() {
        String member_id = "test";
        int result = memberMapper.checkId(member_id);
        log.info("testCheckId result={}", result);
    }

    @Test
    public void testCheckEmail() {
        String member_email = "abc@naver.com";
        int result = memberMapper.checkEmail(member_email);
        log.info("testCheckEmail result={}", result);
    }
}
