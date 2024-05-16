package org.fullstack4.fenny.aop;

import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Log4j2
@Component
@Aspect
public class Aop {
    //다른 메서드 시작 전 수행될 AOP 메소드
    @Before("within(org.fullstack4.fenny..*)")
    public void beforeMethod() {
        log.info("메소드 시작 전 ======================================");
    }

    @After("within(org.fullstack4.fenny..*)")
    public void afterMethod() {
        log.info("메소드 종료 후 ======================================");
    }

    public void springAop(JoinPoint jpt) {
        Signature signature = jpt.getSignature();
        log.info("==================================================");
        log.info("JoinPoint 정보 출력 ");
        log.info("실행 타입 : " + signature.getDeclaringType());
        log.info("실행 메소드" + signature.getName());
        log.info("JoinPoint 정보 출력 ");
        log.info("===================================================");
    }
}