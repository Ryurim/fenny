package org.fullstack4.fenny.dto;

import lombok.*;

import javax.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter

public class LoginDTO {

    @NotBlank(message = "아이디를 입력해 주세요.")
    private String member_id;
    @NotBlank(message = "비밀번호를 입력해 주세요.")
    private String member_pwd;
    private String save_id;
    @Builder.Default
    private int member_login_try = 0;
    @Builder.Default
    private String member_lock = "N";
    @Builder.Default
    private String member_login_lock = "N";
    private String member_login_date;
}
