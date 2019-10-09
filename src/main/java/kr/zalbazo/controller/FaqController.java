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
@RequestMapping("/faq")
public class FaqController {

	@Autowired
	FaqService service;
	
	public static long Faq_Id; 
	
	/*
	 * @GetMapping("/faq") public String list(Model model, Long faqId, FaqVO
	 * keyword) {
	 * 
	 * faqId = Faq_Id;
	 * 
	 * model.addAttribute("FaqList", service.getFaqList(faqId));
	 * 
	 * return "faq"; }
	 */
	
	@GetMapping("/faq")
	public String list(Model model) {
		

		model.addAttribute("FaqList", service.getFaqListAll());
		
		return "faq";
	}
	
	@GetMapping("faq/faqsearchedlist")
	public String searchedlist(Model model, Long faqId, FaqVO keyword) {
	
	
	model.addAttribute("FaqList2", service.getFaqList2(keyword));
	
	
		return "faqsearchedlist";
	}
	

}
