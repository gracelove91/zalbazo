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

import kr.zalbazo.model.user.Reserve;
import kr.zalbazo.service.animal.AnimalService;
import kr.zalbazo.service.hospital.HospitalService;
import kr.zalbazo.service.user.HospitalJoinService;
import kr.zalbazo.service.user.ReserveService;

@Controller
public class HomeController {
	
	@Autowired
	HospitalService hs;
	
	@Autowired
	ReserveService rs;
	
	@Autowired
	AnimalService as;
	
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
    
    @GetMapping("/reserve")
    public String calendar(@RequestParam Long hospitalId, Model model,Principal principal){
    	model.addAttribute("animal",as.getList(principal.getName()));
    	model.addAttribute("hos",hs.get(hospitalId));
    	   	
    	return "/reserve";
    }
    
    @PostMapping("/reserve")
    public String calendarpost(@RequestParam Long hospitalId,@RequestParam String reservedate,@RequestParam String reservetime,Reserve reserve) throws ParseException{

    	String datetext = reservedate+" "+reservetime;
    	
 		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(datetext);

    	Reserve res = reserve;
    	
    	res.setRdate(date);
    	rs.register(res);
    	
    	String result= "redirect:/hospital/get?hospitalId="+hospitalId;
    	
    	
    	return result;
    }
}
