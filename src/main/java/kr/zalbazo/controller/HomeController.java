package kr.zalbazo.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.zalbazo.model.user.Reserve;
import kr.zalbazo.service.hospital.HospitalService;
import kr.zalbazo.service.user.ReserveService;

@Controller
public class HomeController {
	
	@Autowired
	HospitalService hs;
	
	@Autowired
	ReserveService rs;
	
	
    @GetMapping({"/", "/index"})
    public String index(){
        return "/index";
    }
    @GetMapping("calendar")
    public String calendar(@RequestParam Long hospitalId, Model model){
    	
    	model.addAttribute("hos",hs.get(hospitalId));
    	   	
    	return "/calendar";
    }
    @PostMapping("calendar")
    public String calendarpost(@RequestParam Long hospitalId,@RequestParam String reservedate,@RequestParam String reservetime,Reserve reserve) throws ParseException{

    	String datetext = reservedate+" "+reservetime;
    
 		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(datetext);

    	Reserve res = reserve;
    	
    	
    	res.setRdate(date);
//    	res.setAnimalId((long) 1);    임의의값넣을때 (실험용)
//    	res.setNote("ddd");
//    	res.setStatus("dddd");
    	
    	rs.register(res);
    	
    	
    	
    	
    	
    	return "/index";
    }
}
