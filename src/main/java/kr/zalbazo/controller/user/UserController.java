package kr.zalbazo.controller.user;

import kr.zalbazo.model.user.User;
import kr.zalbazo.service.user.UserService;
import kr.zalbazo.validator.UserValidator;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@RequestMapping({"/user/*"})
@Controller
@Log4j
public class UserController {
    @Autowired
    private UserService service;

    @InitBinder
    public void valid(WebDataBinder binder){
        binder.setValidator(new UserValidator(this.service));
    }
    @GetMapping("/register")
    public String join(Model model) {
        model.addAttribute("user",new User());
        return "user/userjoin";
    }

    @PostMapping("/register")
    public String join(@Valid @ModelAttribute User user, BindingResult bindingResult, RedirectAttributes rttr) {

        if(bindingResult.hasErrors()){
            return "user/userjoin";
        }
        user.setPassword("{noop}"+user.getPassword());
        service.register(user);
        rttr.addFlashAttribute("email", user.getEmail());

        return "redirect:/index";
    }
}
