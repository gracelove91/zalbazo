package kr.zalbazo.content;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.zalbazo.model.content.FaqVO;
import kr.zalbazo.service.content.FaqService;
import lombok.extern.log4j.Log4j;


@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/root-context.xml")
@Log4j
public class FaqMapperTests {
	
	@Autowired
	FaqService service;
	
	@Test
	public void test() {
		
	FaqVO faqvo = new FaqVO();
	
	faqvo.setKeyword("파");
	

	}	  

}
