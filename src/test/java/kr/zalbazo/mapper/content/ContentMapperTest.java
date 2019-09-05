package kr.zalbazo.mapper.content;

import kr.zalbazo.model.content.Content;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/root-context.xml")
@Log4j
public class ContentMapperTest {

    @Autowired
    private ContentMapper mapper;

    @Test
    public void testRead(){
        Content content = mapper.read(2L);
        log.info("===================================");
        log.info(content);
    }


    @Test
    public void testUpdate(){
        Content content = new Content();
        content.setTitle("수정타이틀");
        content.setBody("수정내용");
        content.setId(2L);

        int result = mapper.update(content);
        assertThat(result, is(1));
    }

    @Test
    @Transactional
    public void testDelete(){
        int result = mapper.delete(2L);
        assertThat(result, is(1));
    }

    @Test
    @Transactional
    public void testInsert(){
        Content content = new Content();
        content.setUserEmail("govlmo91"); // 여기에 내가 db에서 만든 유저 이메일 넣어야 함
        content.setTitle("매퍼테스트제목");
        content.setBody("매퍼테스트내용");
        content.setCategoryId(2L);
        mapper.insert(content);

        log.info(content);
    }

    @Test
    public void tesGetList(){
        List<Content> list  = mapper.getList(2L);
        list.stream().forEach(content -> log.info(content));
    }
}