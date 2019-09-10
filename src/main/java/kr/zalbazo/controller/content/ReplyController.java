package kr.zalbazo.controller.content;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.zalbazo.model.content.Criteria;
import kr.zalbazo.model.content.ReplyPageDTO;
import kr.zalbazo.model.content.ReplyVO;
import kr.zalbazo.service.ReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService service;
	
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		log.info("ReplyVO : "+ vo);

		int insertCount = service.register(vo);

		log.info("Reply INSERT COUNT : " + insertCount);

		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/pages/{contentId}/{page}",
			produces = { MediaType.APPLICATION_XML_VALUE,
						 MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("contentId") Long contentId) {

		Criteria cri = new Criteria();

		return new ResponseEntity<>(service.getListPage(cri, contentId), HttpStatus.OK);
	}

	@GetMapping(value = "/{replyid}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyVO> get(@PathVariable("replyid") Long replyid) {
		log.info("get : " + replyid);

		return new ResponseEntity<>(service.get(replyid), HttpStatus.OK);
	}

	@DeleteMapping(value = "/{replyid}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("replyid") Long replyid) {
		log.info("remove : "+replyid);

		return service.remove(replyid) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "/{replyid}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("replyid") Long replyid) {

		vo.setReplyid(replyid);
		log.info("replyid : " + replyid);
		log.info("modify : " + vo);
		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
