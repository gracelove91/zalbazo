package kr.zalbazo.controller.user;

import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.ReplyVO;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalQnaVO;
import kr.zalbazo.model.hospital.HospitalReviewVO;
import kr.zalbazo.service.user.MyContentService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/mycontent/")
@RestController
@Log4j
@AllArgsConstructor
public class MyContentController {
	
	private MyContentService myContentService;
	
	@GetMapping(value = "/list/1", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<Content>> getCommunityList(Principal principal) {
		
		return new ResponseEntity<>(myContentService.getCommunityList(principal.getName()), HttpStatus.OK);
	}
	
	@GetMapping(value = "/list/2", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<Content>> getJisikdongList(Principal principal) {
		
		return new ResponseEntity<>(myContentService.getJisikdongList(principal.getName()), HttpStatus.OK);
	}
	
	@GetMapping(value = "/list/3", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<HospitalReviewVO>> getReviewList(Principal principal) {
		
		return new ResponseEntity<>(myContentService.getReviewList(principal.getName()), HttpStatus.OK);
	}
	
	@GetMapping(value = "/list/4/1", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<HospitalQnaVO>> getQList(Principal principal) {
		
		return new ResponseEntity<>(myContentService.getQList(principal.getName()), HttpStatus.OK);
	}
	
	@GetMapping(value = "/list/5", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ReplyVO>> getReplyList(Principal principal) {
		
		return new ResponseEntity<>(myContentService.getReplyList(principal.getName()), HttpStatus.OK);
	}
	
	@GetMapping(value = "/6/{hospitalId}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Hospital> getName(@PathVariable("hospitalId") Long hospitalId) {
		return new ResponseEntity<>(myContentService.getName(hospitalId), HttpStatus.OK);
	}
	
	@DeleteMapping(value="/delQna/{contentId}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> deleteQna(@PathVariable("contentId") Long contentId) {
		return myContentService.deleteQna(contentId) == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value="/delCon/{contentId}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> deleteContent(@PathVariable("contentId") Long contentId) {
		return myContentService.deleteContent(contentId) == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping(value = "/getANo/{contentId}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<HospitalQnaVO> getANo(@PathVariable("contentId") Long contentId) {
		return new ResponseEntity<>(myContentService.getANo(contentId), HttpStatus.OK);
	}
}
