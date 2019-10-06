package kr.zalbazo.controller.user;

import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.ReplyVO;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalQnaVO;
import kr.zalbazo.model.hospital.HospitalReviewVO;
import kr.zalbazo.service.user.MyHospitalContentService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/myhospitalcontent/*")
@RestController
@Log4j
@AllArgsConstructor
public class MyHospitalContentController {
	
	private MyHospitalContentService myHospitalContentService;
	
	@GetMapping(value = "/list/qna", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<HospitalQnaVO>> getHospitalQList(Principal principal) {
		
		return new ResponseEntity<>(myHospitalContentService.getHospitalQList(principal.getName()), HttpStatus.OK);
	}
	
	@PostMapping(value = "/answer", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> insertAnswer(@RequestBody HospitalQnaVO hospitalQnaVO){
		
		int insertAnswer = myHospitalContentService.insertAnswer(hospitalQnaVO);
		
		return insertAnswer == 2 
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	


}
