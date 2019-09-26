package kr.zalbazo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.zalbazo.service.hospital.HospitalService;

@Controller
public class HomeController {
	
	@Autowired
	HospitalService hs;
	
	
    @GetMapping({"/", "/index"})
    public String index(){
        return "/index";
    }
    @RequestMapping("calendar")
    public String calendar(@RequestParam Long hospitalId, Model model){
    	
    	model.addAttribute("hos",hs.get(hospitalId));
    	   	
    	return "/calendar";
    }
}
