package kr.zalbazo.controller.hospital;

import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
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
	public ResponseEntity<String> addQuestion(@RequestBody HospitalQnaVO hospitalQnaVO, Principal principal, Model model, Authentication auth){
		
		hospitalQnaVO.setUserEmail(principal.getName());
		
		int insertQuestion = qnaService.insertQuestion(hospitalQnaVO, auth);
		
		return insertQuestion == 2 
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

	@DeleteMapping(value="/removeA/{contentId}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> removeA(@PathVariable("contentId") Long contentId) {
		return qnaService.removeA(contentId) == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@DeleteMapping(value="/removeQnA/{contentId}" , produces="application/json")
	public ResponseEntity<Integer> removeQnA(@PathVariable("contentId") Long contentId) {
		
		return new ResponseEntity<>(qnaService.removeQnA(contentId), HttpStatus.OK);
	}
	

	@GetMapping(value = "/list/{hospitalId}", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<HospitalQnaVO>> getList(@PathVariable("hospitalId") Long hospitalId) {
		return new ResponseEntity<>(qnaService.getQnaList(hospitalId), HttpStatus.OK);
	}
	
	
}
