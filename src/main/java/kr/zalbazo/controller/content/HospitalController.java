package kr.zalbazo.controller.content;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.HospitalQna;
import kr.zalbazo.service.HospitalService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping({ "/hospital/*" })
public class HospitalController {
	
	@Autowired
	private HospitalService hospitalService;
	
	@GetMapping("/get")
	public void get(@RequestParam("hospitalId") Long hospitalId, Content content, Model model) {
		model.addAttribute("hospital", hospitalService.get(hospitalId));
		model.addAttribute("labelList", hospitalService.getLabelList(hospitalId));
		model.addAttribute("hPictureList", hospitalService.getPictureList(hospitalId));
		model.addAttribute("picCount", hospitalService.getPictureCount(hospitalId));
		model.addAttribute("content", content);
		
		model.addAttribute("qnaList", hospitalService.getHospitalQnaList(hospitalId));
	}
	
	@PostMapping("/write")
	public String writeQna(Content content, HospitalQna hospitalQna, RedirectAttributes rttr) {
		hospitalService.hContentRegister(content);
		hospitalService.hQnaRegister(hospitalQna);
		
		rttr.addAttribute("content", content);
		rttr.addAttribute("hospitalQna", hospitalQna);
		//rttr.addFlashAttribute("qna", hospitalService.getHospitalQnaList());
		//log.info(hospitalService.getHospitalQnaList());
		return "/hospital/write";
	}

}
