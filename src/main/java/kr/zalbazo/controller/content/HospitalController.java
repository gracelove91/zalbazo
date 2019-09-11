package kr.zalbazo.controller.content;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.zalbazo.model.content.Hospital;
import kr.zalbazo.model.content.Label;
import kr.zalbazo.service.HospitalService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping({ "/hospital/*" })
public class HospitalController {
	// private static final Long HOSPITAL_CATEGORY_NUM = 1L;

	@Autowired
	private HospitalService service;


	@GetMapping("/list")
	public void list(Model model, Long hospitalId) {
		
		List<Hospital> hospitalList = service.getList();
		
		/*
		 * hospitalList.forEach(hospital -> {
		 * hospital.setLabel(service.getLabelList(hospital.getId())); });
		 */
		
		/*
		 * for(Hospital hospital : hospitalList) {
		 * hospital.setLabel(service.getLabelList(hospital.getId())); }
		 */
		
		for(int i =0; i < hospitalList.size(); i++) {
			Hospital hospital = hospitalList.get(i);
			hospital.setLabel(service.getLabelList(hospital.getHospitalId()));
		}
		model.addAttribute("hospitalList", hospitalList);
	
//		log.info(service.getList());
//		model.addAttribute("labelList", service.getLabelList(id));
//		log.info(service.getLabelList(id));

	}
	
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
