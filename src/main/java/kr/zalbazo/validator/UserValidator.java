package kr.zalbazo.validator;

import kr.zalbazo.model.user.User;
import kr.zalbazo.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {

    private UserService service;

    public UserValidator(UserService service) {
        this.service = service;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User newUser = (User) target;
        User savedUser = service.get(newUser.getEmail());

        if (savedUser != null) {
            errors.rejectValue("email", "duplicateEmail", "중복된 이메일입니다.");
        }

        if (!newUser.getPassword().equals(newUser.getPassword2())) {
            errors.rejectValue("password", "mismatchPassword", "비밀번호를 다시 확인해주세요.");
        }
    }
}
