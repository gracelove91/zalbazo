package kr.zalbazo.model.user;


import lombok.*;

import javax.validation.constraints.*;
import java.util.Date;

@NoArgsConstructor
@ToString
@AllArgsConstructor
@Getter
@Setter
@Builder
public class User {

    @Email(message = "이메일의 형식이 아닙니다.") @NotBlank(message = "공백이 존재합니다.")  @NotEmpty(message = "비어있습니다")
    private String email;

    @Size(min = 8, message = "비밀번호는 최소 8글자입니다")
    private String password;

    @Size(min = 8, message = "비밀번호는 최소 8글자입니다")
    private String password2;

    private String role;
    private Long tel;
    private String address;
    private String name;
    private Date joinDate;
    private Date lastLogin;


}
