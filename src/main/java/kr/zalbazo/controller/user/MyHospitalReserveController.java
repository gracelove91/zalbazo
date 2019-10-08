package kr.zalbazo.controller.user;

import java.io.Reader;
import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.zalbazo.model.user.Reserve;
import kr.zalbazo.model.user.User;
import kr.zalbazo.service.user.MyHospitalReserveService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/myhospitalreserve/")
@Controller
@Log4j
@AllArgsConstructor
public class MyHospitalReserveController {

	private MyHospitalReserveService myHospitalReserveService;
	
	@GetMapping(value = "/list", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<Reserve>> getHospitalReserveList(Principal principal) {
		
		return new ResponseEntity<>(myHospitalReserveService.getHospitalReserveList(principal.getName()), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{reserveId}", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Reserve> get(@PathVariable("reserveId") Long reserveId) {
		
		return new ResponseEntity<>(myHospitalReserveService.get(reserveId), HttpStatus.OK);
	}
	
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "/update", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> update(@RequestBody Reserve reserve) {
		
		return myHospitalReserveService.update(reserve) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value = "/{reserveId}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> delete(@PathVariable("reserveId") Long reserveId) {
		log.info("remove : "+reserveId);

		return myHospitalReserveService.delete(reserveId) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
