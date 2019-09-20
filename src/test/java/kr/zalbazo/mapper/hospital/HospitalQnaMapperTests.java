package kr.zalbazo.mapper.hospital;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.hospital.HospitalQnaVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/root-context.xml")
@Log4j
public class HospitalQnaMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private HospitalQnaMapper qnaMapper;
	
	@Test
	public void testMapper() {
		log.info(qnaMapper);
	}
	
	private Long[] hospitalArr = {1L, 2L, 3L};
	
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 3).forEach(i -> {
			
			Content content = new Content();
			HospitalQnaVO hospitalQna = new HospitalQnaVO();
			
			content.setBody("h댓글 테스트 ");
			hospitalQna.setHospitalId(hospitalArr[i%3]);
			
			//qnaMapper.insertContent(content);
			//qnaMapper.insertQna(hospitalQna);
			
		});
	}
	
	@Test
	public void testDelete() {
		Long contentId = 29L;
		
		qnaMapper.deleteQna(contentId);
		qnaMapper.deleteContent(contentId);
	}
	
	@Test
	public void testList() {
		List<HospitalQnaVO> qna = qnaMapper.getQnaList(11L);
		
		qna.forEach(body -> log.info(body));
	}

}
