package kr.zalbazo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @GetMapping({"/", "/index"})
    public String index(){
        return "/index";
    }
    @RequestMapping("calendar")
    public String calendar(){
    	return "/calendar";
    }
}
