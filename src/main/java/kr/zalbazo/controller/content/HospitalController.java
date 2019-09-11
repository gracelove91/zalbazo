package kr.zalbazo.controller.content;

import java.util.List;

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

	private static final Long HOSPITAL_CATEGORY_NUM = 1L;

	@Autowired
	private HospitalService service;
	/*
	 * @GetMapping("/register") public String register(){ return
	 * "/hospital/register"; //WEB-INF/views/register.jsp }
	 * 
	 * @PostMapping("/register") public String register(Content content,
	 * RedirectAttributes rttr){ content.setCategoryId(HOSPITAL_CATEGORY_NUM);
	 * 
	 * service.register(content);
	 * 
	 * rttr.addFlashAttribute("result", content);
	 * 
	 * return "redirect:/hospital/list"; }
	 * 
	 * @GetMapping("/list") public void list(Criteria cri, Model model){
	 * cri.setCategory(COMMUNITY_CATEGORY_NUM); model.addAttribute("contentList",
	 * service.getList(cri)); int total = service.getTotal(cri); log.info("list : "
	 * + cri); model.addAttribute("pageMaker", new PageDTO(cri, total)); }
	 * 
	 * @GetMapping({"/get", "/modify"}) public void detail(@RequestParam("id") Long
	 * id, Model model, @ModelAttribute("cri") Criteria cri){
	 * model.addAttribute("content", service.get(id)); }
	 * 
	 * @PostMapping("/modify") public String modify(Content content,
	 * RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri){
	 * 
	 * if(service.modify(content)){ rttr.addFlashAttribute("result", "success"); }
	 * return "redirect:/community/list"; }
	 * K
	 * @PostMapping("/remove") public String remove(@RequestParam("id") Long id,
	 * RedirectAttributes rttr){
	 * 
	 * if(service.remove(id)){ rttr.addFlashAttribute("result", "success"); } return
	 * "redirect:/community/list"; }
	 */

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

}
