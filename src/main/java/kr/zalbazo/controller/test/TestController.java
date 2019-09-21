package kr.zalbazo.controller.test;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.Enumeration;

@Controller
public class TestController {

    @GetMapping("/test")
    public void test(Authentication authentication) {
        Object details = authentication.getDetails();
    }
}
