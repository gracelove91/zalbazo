package kr.zalbazo.controller.hospital;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.zalbazo.model.favorite_hospital.FavoriteHospital;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.service.hospital.FavoriteHospitalService;
import kr.zalbazo.service.hospital.HospitalService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// 여기는 병원 상세페이지에서 즐겨찾는 병원으로 등록하는 것을 컨트롤하는 곳입니다~~~~
@RequestMapping({ "/hospital/*" })
@RestController
@Log4j
@AllArgsConstructor
public class FavoriteHospitalController {

	@Autowired
	private FavoriteHospitalService favoriteHospital_service;


	@PostMapping(value = "/register", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> register(@RequestBody FavoriteHospital favoriteHospital, Model model, Hospital hospital, Principal principal){
		
		
   	favoriteHospital.setUserEmail(principal.getName());
    	
   	model.addAttribute("favoriteHospitalList", favoriteHospital_service.getList(favoriteHospital));
   	model.addAttribute("userEmail", principal.getName());
   	
   	List<Hospital> favoriteHospitalList = favoriteHospital_service.getList(favoriteHospital);
          
   	model.addAttribute("favoriteHospitalList",favoriteHospitalList);
		int insert = favoriteHospital_service.register(favoriteHospital);
		return insert == 1 
			? new ResponseEntity<>("success", HttpStatus.OK)
			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
			
		
	}

	@DeleteMapping(value="/remove/{hospitalId}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("hospitalId") Long hospitalId, Model model, FavoriteHospital favoriteHospital, Principal principal) {
	 
		favoriteHospital.setUserEmail(principal.getName());
	 	model.addAttribute("userEmail", principal.getName());
    	
		return favoriteHospital_service.remove(hospitalId) == 2
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}


