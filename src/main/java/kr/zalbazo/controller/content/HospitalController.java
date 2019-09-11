package kr.zalbazo.controller.content;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.zalbazo.service.HospitalService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping({ "/hospital/*" })
public class HospitalController {
	
	@Autowired
	private HospitalService hospitalService;
	
	@GetMapping("/get")
	public void get(@RequestParam("id") Long id, Model model) {
		model.addAttribute("hospital", hospitalService.get(id));
		log.info(hospitalService.getLabelList(id));
		model.addAttribute("labelList", hospitalService.getLabelList(id));
		model.addAttribute("hPictureList", hospitalService.getPictureList(id));
		log.info(hospitalService.getPictureList(id));
	}

}
