package kr.zalbazo.controller.hospital;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.favorite_hospital.FavoriteHospital;
import kr.zalbazo.model.hospital.HospitalListVO;
import kr.zalbazo.service.hospital.HospitalService;
import kr.zalbazo.service.hospital.HospitalService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping({ "/hospital/*" })
@Controller
@Log4j
@AllArgsConstructor
public class HospitalController {

	@Autowired
	private HospitalService hospitalService;


	@GetMapping("/get")
	public void get(@RequestParam("hospitalId") Long hospitalId, Content content, Model model) {
		model.addAttribute("hospital", hospitalService.get(hospitalId));
		model.addAttribute("labelList", hospitalService.getLabelList(hospitalId));
		model.addAttribute("picList", hospitalService.getPictureList(hospitalId));
		model.addAttribute("picCount", hospitalService.getPictureCount(hospitalId));
		model.addAttribute("content", content);

	    
//		model.addAttribute("qnaList", hospitalService.getHospitalQnaList(hospitalId));
	}
	

	@GetMapping("/list")
	public void list(Model model, Long hospitalId) {

		List<HospitalListVO> hospitalList = hospitalService.getList();
		model.addAttribute("hospitalList", hospitalList);

		/* 라벨 처리 */
		for (int i = 0; i < hospitalList.size(); i++) {
			HospitalListVO hospitalListVO = hospitalList.get(i);
			hospitalListVO.setLabel(hospitalService.getLabelList(hospitalListVO.getHospitalId()));
		}
		
	}


}
