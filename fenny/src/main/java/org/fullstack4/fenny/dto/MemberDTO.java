package org.fullstack4.fenny.dto;

import lombok.*;
import javax.validation.constraints.NotBlank;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class MemberDTO {
    @NotBlank(message = "아이디를 입력해 주세요.")
    private String member_id;
    @NotBlank(message = "비밀번호를 입력해 주세요.")
    private String member_pwd;
    private LocalDateTime member_reg_date;
    @NotBlank(message = "이름을 입력해 주세요.")
    private String member_name;

    @NotBlank(message = "전화번호를 입력해 주세요.")
    private String member_phone;

    @NotBlank(message = "이메일을 입력해 주세요.")
    private String member_email;

    private String member_type;
    private LocalDateTime member_login_date;
    private String member_lock;
    private int member_login_try;
    private String member_login_lock;
    private LocalDateTime member_pwd_modify_date;

}
