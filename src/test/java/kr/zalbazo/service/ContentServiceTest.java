package kr.zalbazo.service;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.Criteria;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;


//TODO : 서비스테스트 만들어야함.


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/root-context.xml")
@Log4j
public class ContentServiceTest {

    @Autowired
    ContentService service;

//    @Test
//    public void testExist(){
//      log.info(service.getList(2L));
//    }
    
    @Test
    public void testGetList() {
    	service.getList(new Criteria(2L)).forEach(content -> log.info(content));
    }

    @Transactional
    @Test
    public void testReg(){
        Content content = new Content();
        content.setTitle("서비스테스트제목.");
        content.setBody("서비스테스트바디");
        content.setUserEmail("gracelove91@gmail.com");
        content.setCategoryId(1L);

        service.register(content);
    }

}