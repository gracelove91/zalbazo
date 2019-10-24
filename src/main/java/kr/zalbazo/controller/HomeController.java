package kr.zalbazo.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomeController {
	
	@PostMapping("/myhospitalmodify")
	public String modify(Model model) {
		return "user/hospital/myhospitalmodify";
	}
    @GetMapping("/myhospitalpage")
    public String mypage(Principal principal, Model model) {
    	return "user/myhospitalpage";
    }
	
    @GetMapping({"/", "/index"})
    public String index(){
        return "/index";
    }
    
    @GetMapping("/aboutus")
    public String aboutus() {
    	return "/aboutus";
    }
    
}
