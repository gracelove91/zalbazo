package kr.zalbazo.controller.loginout;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LogInOutController {

    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }
}
