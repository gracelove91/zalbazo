package kr.zalbazo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import kr.zalbazo.model.content.FaqVO;
import kr.zalbazo.service.content.FaqService;

@Controller
public class FaqController {

	@Autowired
	FaqService service;
	
	
	@GetMapping("/faq")
	public String list(Model model) {
		

		model.addAttribute("FaqListAll", service.getFaqListAll());
		
		return "faq";
	}
	
	@GetMapping("faq/faqsearchedlist")
	public String searchedlist(Model model, Long faqId, FaqVO keyword) {
	
	
	model.addAttribute("FaqList", service.getFaqList(keyword));
	model.addAttribute("FaqListAll", service.getFaqListAll());
	
		return "faqsearchedlist";
	}
	

}
