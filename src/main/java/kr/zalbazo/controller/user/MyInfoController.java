package kr.zalbazo.controller.user;

import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "/modify", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody User user, Principal principal) {
		
		user.setUserEmail(principal.getName());
		
		return myInfoService.modify(user) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
