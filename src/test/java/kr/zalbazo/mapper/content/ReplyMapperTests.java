package kr.zalbazo.mapper.content;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.zalbazo.model.content.Criteria;
import kr.zalbazo.model.content.ReplyVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	@Autowired
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
//	@Test
//	public void testCrate() {
//		
//		IntStream.rangeClosed(1, 10).forEach(i -> {
//			
//			ReplyVO vo = new ReplyVO();
//			
//			//게시물 번호
//			vo.setId(157L);
//			vo.setBody("커뮤댓글 테스트 "+i);
//			vo.setUserEmail("dummy@gmail.com");
//			
//			mapper.insert(vo);
//		});
//	}
	
//	@Test
//	public void testRead() { // 댓글보기
//		Long targetId = 157L;
//		
//		ReplyVO vo = mapper.read(targetId);
//		
//		log.info(vo);
//	}

//	@Test
//	public void testDelete() {
//		
//		Long targetReplyId = 12L;
//		
//		mapper.delete(targetReplyId);
//	}
//	
//	@Test
//	public void testUpdate() {
//		
//		Long targetId = 1L;
//		
//		ReplyVO vo = mapper.read(targetId);
//		
//		vo.setBody("update!");
//		
//		int count = mapper.update(vo);
//		
//		log.info("update count : "+count);
//	}
//	
//	@Test
//	public void testList() {
//		Criteria cri = new Criteria();
//		
//		List<ReplyVO> replies = mapper.getListWithPaging(cri, 1L);
//		
//		replies.forEach(body -> log.info(body));
//	}
	
//	@Test
//	public void testList2() {
//		
//		Criteria cri = new Criteria(2, 10, 2L);
//		
//		List<ReplyVO> replies = mapper.getListWithPaging(cri, 1L);
//		
//		replies.forEach(body -> log.info(body));
//	}

}
