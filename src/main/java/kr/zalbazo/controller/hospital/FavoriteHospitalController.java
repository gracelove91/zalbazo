package kr.zalbazo.controller.hospital;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

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

@RequestMapping({ "/hospital/*" })
@RestController
@Log4j
@AllArgsConstructor
public class FavoriteHospitalController {

	@Autowired
	private HospitalService hospitalService;
	
	@Autowired
	private FavoriteHospitalService favoriteHospital_service;


	@PostMapping(value = "/register", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> register(@RequestBody FavoriteHospital favoriteHospital, Model model, Hospital hospital){
		
		
   	favoriteHospital.setUserEmail("dummy@gmail.com");
    	
   	model.addAttribute("favoriteHospitalList", favoriteHospital_service.getList(favoriteHospital));
   	model.addAttribute("userEmail", "dummy@gmail.com");
   	
   	List<Hospital> favoriteHospitalList = favoriteHospital_service.getList(favoriteHospital);
   	
   	// 페이보릿리스트에 페이보릿하스피럴이 있는지,,?
   	// hospitalId 비교

//   		  for (int i = 0; i < favoriteHospitalList.size(); i++) {
//   			  for (int j = 0; j < favoriteHospitalList.size(); j++) {
//   				  if (i==j) {
//   				  } else if (favoriteHospitalList.get(j).equals(favoriteHospitalList.get(i))) {
//   					favoriteHospitalList.remove(j);
//   				  }
//   			  }
//   		  }
    for (int i = 0; i < favoriteHospitalList.size(); i++) {
    	 for (int j = 0; j < favoriteHospitalList.size(); j++) {
   			  String newTel = favoriteHospital.getTel(); //내가 즐찾하려는 병원의 아이디
   			  String oldTel = favoriteHospitalList.get(i).getTel(); // 이미 즐찾 등록이 된 병원들 중 한 병원의 아이디

   			  // 내가 즐찾한 리스트에 MyhId가 이미 있으면, hId를 삭제한다.
   			  if (newTel==oldTel) {   				  
					favoriteHospitalList.remove(i);
 				  }
   			  }
    	 System.out.println("리스트?????????????" + favoriteHospitalList);
    }
//   			  
//   			  System.out.println("내 즐찾"+MyhId);
//   			  System.out.println("병원 아뒤"+hId);
//   			  
//              Hospital hospital = favoriteHospitalList.get(i);
//              (favoriteHospital_service.getLabelList(hospital.getHospitalId()));

   			//   			  for (int i = 0; i < favoriteHospitalList.size(); i++) {
//   	            Hospital hospital = favoriteHospitalList.get(i);
//   	            hospital.setLabel(favoriteHospital_service.getLabelList(hospital.getHospitalId()));
//   	        }
          
   	
		int insert = favoriteHospital_service.register(favoriteHospital);
		return insert == 1 
			? new ResponseEntity<>("success", HttpStatus.OK)
			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
			
		
	}

	@DeleteMapping(value="/remove/{hospitalId}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("hospitalId") Long hospitalId) {
		
		return favoriteHospital_service.remove(hospitalId) == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}


