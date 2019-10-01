package kr.zalbazo.controller.user;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.zalbazo.model.favorite_hospital.MyFavoriteHospital;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.service.user.MyFavoriteHospitalService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@AllArgsConstructor
@Controller
@Log4j
@RequestMapping("/user/mypage/*")
public class MyFavoriteHospitalController {

    @Autowired
	private MyFavoriteHospitalService myFavoriteHospitalService;
	
 	@ResponseBody
 	@GetMapping(value = "/favorite_list", produces = { 
 			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
 	public ResponseEntity<List<Hospital>> getList(Principal principal) {
 		
 		return new ResponseEntity<>(myFavoriteHospitalService.getList(principal.getName()), HttpStatus.OK);
 	}
 	
 	@ResponseBody
	@DeleteMapping(value="/favorite_list/remove/{hospitalId}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> removeMyFavorite(@PathVariable("hospitalId") Long hospitalId, Model model, MyFavoriteHospital myFavoriteHospital, Principal principal) {
		
 		myFavoriteHospital.setUserEmail(principal.getName());
        model.addAttribute("userEmail", principal.getName());
 		
		return myFavoriteHospitalService.removeMyFavorite(hospitalId) == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

 	
}
