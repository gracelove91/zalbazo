package kr.zalbazo.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.zalbazo.model.user.Reserve;
import kr.zalbazo.service.animal.AnimalService;
import kr.zalbazo.service.hospital.HospitalService;
import kr.zalbazo.service.user.ReserveService;

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
    
  
}
