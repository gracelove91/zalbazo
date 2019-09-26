package kr.zalbazo.controller.user;

import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.zalbazo.model.user.User;
import kr.zalbazo.service.user.MyInfoService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/myinfo/")
@Controller
@Log4j
@AllArgsConstructor
public class MyInfoController {

	private MyInfoService myInfoService;
	
	@GetMapping(value = "/info", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<User>> getInfoList(Principal principal) {
		
		return new ResponseEntity<>(myInfoService.getInfoList(principal.getName()), HttpStatus.OK);
	}
}
