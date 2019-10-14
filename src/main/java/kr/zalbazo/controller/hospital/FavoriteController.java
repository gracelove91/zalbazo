package kr.zalbazo.controller.hospital;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.service.hospital.FavoriteService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
@RequestMapping("/favorite/*")
public class FavoriteController {

	@Autowired
	private FavoriteService service;

	@PostMapping(value = "/insert", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> insert(@RequestBody Hospital hospital, Model model, Principal principal){
		
		hospital.setUserEmail(principal.getName());
	    	
		int insert = service.toFullHeart(hospital);
		
		return insert == 1 
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	

	@DeleteMapping(value="/remove/{fhospitalId}", produces="application/json")
	public ResponseEntity<Integer> remove(@PathVariable("fhospitalId") Long fhospitalId) {
	 
		return new ResponseEntity<>(service.removeFavorite(fhospitalId), HttpStatus.OK);
	}
	
	
	@GetMapping(value ="/list/{userEmail}" , produces = {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Hospital>> getFavoriteList(Principal principal){
		return new ResponseEntity<>(service.getFavoriteList(principal.getName()), HttpStatus.OK);
	}
	
	
	@DeleteMapping(value = "/heart/{hospitalId}", produces = "application/json")
	public ResponseEntity<Integer> heart(@PathVariable("hospitalId") Long hospitalId, Principal principal) {
		
		return new ResponseEntity<>(service.toEmptyHeart(hospitalId, principal.getName()), HttpStatus.OK);
	}
	

}


