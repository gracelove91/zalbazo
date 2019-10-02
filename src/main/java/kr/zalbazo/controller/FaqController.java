package kr.zalbazo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/FAQ")
public class FaqController {

	@GetMapping("/FAQ")
	public String list() {
		
		System.out.println("ok");
		return "FAQ";
	}
}
