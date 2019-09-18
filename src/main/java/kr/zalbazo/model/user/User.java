package kr.zalbazo.model.user;


import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.crypto.password.PasswordEncoder;

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
    private String userEmail;

    @Size(min = 8, message = "비밀번호는 최소 8글자입니다")
    private String password;

    @Size(min = 8, message = "비밀번호는 최소 8글자입니다")
    private String password2;

    private String role;

    @Pattern(regexp = "(^[0-9]*$)", message = " '-' 를 제외한 숫자만 적어주세요.")
    private String tel;

    private String address;
    private String name;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date joinDate;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date lastLogin;

    private String emailAuthKey;
    private String enabled;


    public void encodePassword(PasswordEncoder encoder){
        this.password = encoder.encode(this.password);
    }

}