package kr.zalbazo.mapper.user;

import java.security.Principal;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.zalbazo.mapper.user.mypage.MyContentMapper;
import kr.zalbazo.model.content.Content;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/views/exception/root-context.xml")
@Log4j
public class MyContentMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private MyContentMapper mapper;
	
	String userEmail = "lulu_082@naver.com";

//	Principal principle;
//	
//	String userEmail = principle.getName();
	
	@Test
	public void testCommunityList() {
		
		List<Content> getCommunityList = mapper.getCommunityList(userEmail);
		
		getCommunityList.forEach(list -> log.info(list));
	}
	
	@Test
	public void testJisikdongList() {
		
		List<Content> getJisikdongList = mapper.getJisikdongList(userEmail);
		
		getJisikdongList.forEach(list -> log.info(list));
	}

}
