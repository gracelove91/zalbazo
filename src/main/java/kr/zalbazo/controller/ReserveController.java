package kr.zalbazo.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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
public class ReserveController {
	
	@Autowired
	HospitalService hs;
	
	@Autowired
	ReserveService rs;
	
	@Autowired
	AnimalService as;

	
	  @GetMapping("/reserve")
	    public String reserve(@RequestParam Long hospitalId, Model model,Principal principal){
	    	model.addAttribute("animal",as.getList(principal.getName()));
	    	model.addAttribute("hos",hs.get(hospitalId));
	    	   	
	    	return "/reserve";
	    }
	    
	    @PostMapping("/reserve")
	    public String reservepost(@RequestParam Long hospitalId,@RequestParam String reservedate,@RequestParam String reservetime,Reserve reserve) throws ParseException{

	    	String datetext = reservedate+" "+reservetime;
	    	
	 		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(datetext);

	    	Reserve res = reserve;
	    	
	    	res.setRdate(date);
	    	rs.register(res);
	    	
	    	String result= "redirect:/hospital/get?hospitalId="+hospitalId;
	    	
	    	
	    	return result;
	    }
	    
	    @GetMapping(value = "/reserve.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	    @ResponseBody
	    public Map reservecheck(@RequestParam String date, @RequestParam String hospitalId) throws Exception {
	    	
	    	Map<String, Object> dateMap = new HashMap<String, Object>();
	    	dateMap.put("date",rs.getTime(date,hospitalId));
	    	
			return dateMap;
	    	
	    }
}
