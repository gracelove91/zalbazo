package kr.zalbazo.content;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.zalbazo.mapper.content.ContentMapper;
import kr.zalbazo.model.content.Content;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/views/exception/root-context.xml")
@Log4j
public class ContentMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private ContentMapper mapper;
	
	@Test
	public void testDelete() {
		log.info("Delete : "+mapper.delete(1L));
	}
	
	@Test
	public void testUpdate() {
		
		Content content = new Content();
		
		content.setContentId(15L);
		content.setTitle("수정수정");
		content.setBody("수정수정");
		content.setUserEmail("lulu_082@naver.com");
		content.setCategoryId(2L);
		
		int count = mapper.update(content);
	}

}
