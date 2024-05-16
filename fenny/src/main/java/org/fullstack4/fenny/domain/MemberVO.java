package org.fullstack4.fenny.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
    private String member_id;
    private String member_pwd;
    private LocalDateTime member_reg_date;
    private String member_name;
    private String member_birth;
    private String member_sex;
    private String member_phone;
    private String member_image;
    private String member_email;
    private String member_addr1;
    private String member_addr2;
    private String member_zipcode;
    private String member_type;
    private LocalDateTime member_login_date;
    private String member_lock;
    private int member_login_try;
    private String member_login_lock;
    private LocalDateTime member_pwd_modify_date;
}
