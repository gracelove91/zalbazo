package kr.zalbazo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.zalbazo.model.content.Criteria;
import kr.zalbazo.model.content.FaqVO;
import kr.zalbazo.service.content.FaqService;

@Controller
public class FaqController {

	@Autowired
	FaqService service;
	
	public static final long Faq_Id = 2L;
	
	@GetMapping("/faq")
	public String list() {
		
		return "faq";
	}
	
	
	@GetMapping("faq/faqsearchedlist")
	public String searchedlist(Criteria cri, Model model, Long faqId, FaqVO keyword) {
	
	faqId = Faq_Id;
	
	System.out.println(faqId);
	
	model.addAttribute("FaqList", service.getFaqList(faqId));
	model.addAttribute("FaqList2", service.getFaqList2(keyword));
	
	
		return "faqsearchedlist";
	}
	

}
