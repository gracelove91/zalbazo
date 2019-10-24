package kr.zalbazo.controller.hospital;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.zalbazo.mapper.hospital.HospitalMapper;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.user.User;
import kr.zalbazo.service.hospital.HospitalService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping({ "/hospital/*" })
@Controller
@Log4j
@AllArgsConstructor
public class HospitalController {

	@Autowired
	private HospitalService service;
	
	@Autowired
	HospitalMapper mapper;

	
	@GetMapping("/get")
	public void get(@RequestParam("hospitalId") Long hospitalId, Model model) {
		
		model.addAttribute("hospital", service.get(hospitalId));
		model.addAttribute("picCount", mapper.picCount(hospitalId));

	}

	@GetMapping("/list")
	public void list(Model model) {

		List<Hospital> hospitalList = service.getList();
		model.addAttribute("list", hospitalList);
		
	}

}