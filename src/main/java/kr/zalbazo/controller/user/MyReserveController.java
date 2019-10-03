package kr.zalbazo.controller.user;

import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.zalbazo.model.hospital.HospitalReviewVO;
import kr.zalbazo.model.user.Reserve;
import kr.zalbazo.service.user.MyReserveService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/myreserve/")
@Controller
@Log4j
@AllArgsConstructor
public class MyReserveController {

	private MyReserveService myReserveService;
	
	@GetMapping(value = "/r", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<Reserve>> getReserveList(Principal principal) {
		
		return new ResponseEntity<>(myReserveService.getReserveList(principal.getName()), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{reserveId}", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Reserve> get(@PathVariable("reserveId") Long reserveId, Principal principal) {
		
		return new ResponseEntity<>(myReserveService.get(reserveId, principal.getName()), HttpStatus.OK);
	}
	
	// 병원별 리뷰 등록
	@PostMapping(value="/review", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> insertReview(@RequestBody HospitalReviewVO hospitalReviewVO, Principal principal) {
		int insertReview = myReserveService.insertReview(hospitalReviewVO);
		
		hospitalReviewVO.setUserEmail(principal.getName());
		
		return insertReview == 2
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
