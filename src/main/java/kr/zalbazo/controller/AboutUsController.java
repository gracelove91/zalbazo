package kr.zalbazo.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalReviewVO;
import kr.zalbazo.model.user.Reserve;
import kr.zalbazo.model.user.User;
import kr.zalbazo.service.AboutUsService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/aboutus/")
@RestController
@Log4j
@AllArgsConstructor
public class AboutUsController {
	
	private AboutUsService aboutUsService;
	
	@GetMapping(value= "/reserve", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity <Integer> reseveCount(Reserve reserve) {
		return new ResponseEntity<>(aboutUsService.reseveCount(reserve), HttpStatus.OK);
	}
	
	@GetMapping(value= "/review", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity <Integer> reviewCount(HospitalReviewVO hospitalReviewVO) {
		return new ResponseEntity<>(aboutUsService.reviewCount(hospitalReviewVO), HttpStatus.OK);
	}
	
	@GetMapping(value= "/user", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity <Integer> userCount(User user) {
		return new ResponseEntity<>(aboutUsService.userCount(user), HttpStatus.OK);
	}
	
	@GetMapping(value= "/hospital", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity <Integer> hospitalCount(Hospital hospital) {
		return new ResponseEntity<>(aboutUsService.hospitalCount(hospital), HttpStatus.OK);
	}
	
}
