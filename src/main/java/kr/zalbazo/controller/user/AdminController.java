package kr.zalbazo.controller.user;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.zalbazo.model.user.User;
import kr.zalbazo.service.user.AdminService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/admin/")
@RestController
@Log4j
@AllArgsConstructor
public class AdminController {
	
	private AdminService adminService;
	
	@GetMapping(value = "/list/user", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<User>> getUserList() {
		
		return new ResponseEntity<>(adminService.getUserList(), HttpStatus.OK);
	}
	
	@GetMapping(value = "/list/hos", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<User>> getHosList() {
		
		return new ResponseEntity<>(adminService.getHosList(), HttpStatus.OK);
	}
	
	@GetMapping(value = "/get/{userEmail}", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<User> get(@PathVariable("userEmail") String userEmail) {
		
		return new ResponseEntity<>(adminService.get(userEmail), HttpStatus.OK);
	}
	
}
