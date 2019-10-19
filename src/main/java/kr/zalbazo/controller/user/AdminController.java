package kr.zalbazo.controller.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
@ResponseBody
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
	
	@GetMapping(value = "/getuser/{userEmail}", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<User> getUser(@PathVariable("userEmail") String userEmail) {
		
		return new ResponseEntity<>(adminService.getUser(userEmail), HttpStatus.OK);
	}
	
	@GetMapping(value = "/gethos/{userEmail}", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<User> getHos(@PathVariable("userEmail") String userEmail) {
		
		return new ResponseEntity<>(adminService.getHos(userEmail), HttpStatus.OK);
	}
	
	@GetMapping(value = "/getsearchuser", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<User> getsearchUser(@RequestParam("userEmail") String userEmail) {
				
		return new ResponseEntity<>(adminService.getsearchUser(userEmail), HttpStatus.OK);
	}
	@GetMapping(value = "/getsearchhos", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<User> getsearchHost(@RequestParam("userEmail") String userEmail) {
		
		return new ResponseEntity<>(adminService.getsearchHos(userEmail), HttpStatus.OK);
	}
	
	
}
