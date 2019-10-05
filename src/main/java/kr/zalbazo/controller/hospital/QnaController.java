package kr.zalbazo.controller.hospital;

import java.security.Principal;
import java.util.List;

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

import kr.zalbazo.model.hospital.HospitalQnaVO;
import kr.zalbazo.service.hospital.HospitalQnaService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/qna/")
@RestController
@Log4j
@AllArgsConstructor
public class QnaController {
	
	private HospitalQnaService qnaService;
	
	@PostMapping(value = "/question", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> addQuestion(@RequestBody HospitalQnaVO hospitalQnaVO, Principal principal){
		
		hospitalQnaVO.setUserEmail(principal.getName());
		
		int insertHospitalQna = qnaService.insertHospitalQna(hospitalQnaVO);
		
		return insertHospitalQna == 2 
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
	}

	@PostMapping(value = "/answer", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> addAnswer(@RequestBody HospitalQnaVO hospitalQnaVO){
		
		int insertAnswer = qnaService.insertAnswer(hospitalQnaVO);
		
		return insertAnswer == 2 
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	
	@DeleteMapping(value="/delQna/{contentId}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> removeQna(@PathVariable("contentId") Long contentId) {
		return qnaService.removeQna(contentId) == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value="/delCon/{contentId}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> removeCon(@PathVariable("contentId") Long contentId) {
		return qnaService.removeContent(contentId) == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/list/{hospitalId}", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<HospitalQnaVO>> getList(@PathVariable("hospitalId") Long hospitalId) {
		return new ResponseEntity<>(qnaService.getQnaList(hospitalId), HttpStatus.OK);
	}
	
	@PostMapping(value = "/getANo/{contentId}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<HospitalQnaVO> getANo(@PathVariable("contentId") Long contentId) {
		return new ResponseEntity<>(qnaService.getANo(contentId), HttpStatus.OK);
	}
	
}
