package kr.zalbazo.controller.user;

import kr.zalbazo.model.user.User;
import kr.zalbazo.service.user.UserService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicBoolean;

@RequestMapping({"/user/*"})
@Controller
@Log4j
public class UserController {
    @Autowired
    private UserService service;

    @GetMapping("/register")
    public String join(Model model) {
        model.addAttribute("user",new User());
        return "user/userjoin";
    }

    @PostMapping("/register")
    public String join(@Valid @ModelAttribute User user, BindingResult bindingResult, RedirectAttributes rttr) {
        validator(user, bindingResult);

        if(bindingResult.hasErrors()){
            return "user/userjoin";
        }
        service.register(user);
        rttr.addFlashAttribute("email", user.getEmail());

        return "redirect:/index";
    }

    private void validator(@ModelAttribute @Valid User user, BindingResult bindingResult) {
        AtomicBoolean duplicateEmail = new AtomicBoolean(false);
        Optional.ofNullable(service.get(user.getEmail())).ifPresent(savedUser -> {
            duplicateEmail.set(savedUser.getEmail().equals(user.getEmail()));
        });

        if(duplicateEmail.get()){
            bindingResult.addError(new FieldError("user", "email", "중복된 이메일입니다."));
        }
        if(!user.getPassword().equals(user.getPassword2())){
            bindingResult.addError(new FieldError("user", "password", "비밀번호를 다시 확인해주세요."));
            bindingResult.addError(new FieldError("user", "password2", "비밀번호를 다시 확인해주세요."));
        }
    }

}
