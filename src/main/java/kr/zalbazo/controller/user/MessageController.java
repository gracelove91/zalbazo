package kr.zalbazo.controller.user;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.zalbazo.model.user.MessageVO;
import kr.zalbazo.service.user.MessageService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/message/")
@RestController
@Log4j
@AllArgsConstructor
public class MessageController {
	
	private MessageService service;
	
	
	@PostMapping(value = "/send", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> send(@RequestBody MessageVO vo) {
		int sendMessage = service.send(vo);
		
		return sendMessage == 2
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}

	
	@PostMapping(value = "/reply", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> reply(@RequestBody MessageVO vo) {
		int replyMessage = service.reply(vo);
		
		return replyMessage == 2
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@DeleteMapping(value = "/remove/{contentId}", produces = "application/json")
	public ResponseEntity<Integer> remove(@PathVariable("contentId") Long contentId) {
		return new ResponseEntity<>(service.delete(contentId), HttpStatus.OK);
	}
	
	
	@GetMapping(value = "/adminList", produces = 
		{MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<MessageVO>> adminList(){
		return new ResponseEntity<>(service.getAdminList(), HttpStatus.OK);
	}
	
	
	@GetMapping(value = "/userList/{userEmail}", produces = 
		{MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<MessageVO>> userList(@PathVariable("userEmail") String userEmail) {
		return new ResponseEntity<>(service.getUserList(userEmail), HttpStatus.OK);
	}
	
	
	@GetMapping(value = "/get/{contentId}", produces = {
		MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<MessageVO> get(@PathVariable("contentId") Long contentId) {
		return new ResponseEntity<>(service.getInfo(contentId), HttpStatus.OK);
	}
	
}
