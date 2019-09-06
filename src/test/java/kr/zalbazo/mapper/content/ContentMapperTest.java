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
import java.util.stream.IntStream;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/root-context.xml")
@Log4j
public class ContentMapperTest {

	@Autowired
	private ContentMapper mapper;

	@Test
	public void testRead() {
		Content content = mapper.read(2L);
		log.info("===================================");
		log.info(content);
	}

	@Test
	public void testUpdate() {
		Content content = new Content();
		content.setTitle("수정타이틀");
		content.setBody("수정내용");
		content.setId(2L);

		int result = mapper.update(content);
		assertThat(result, is(1));
	}

	@Test
	@Transactional
	public void testDelete() {
		int result = mapper.delete(2L);
		assertThat(result, is(1));
	}

    @Test
    public void testInsert(){
        //지식동 가짜 게시물 저장.
        IntStream.rangeClosed(1, 100).forEach(num -> { // new Content 100개 생성
            Content content = new Content();
            content.setUserEmail("dummy@gmail.com");
            content.setTitle("매퍼테스트제목지식동"+num);
            content.setBody("매퍼테스트내용지식동"+num);
            content.setCategoryId(2L);
            mapper.insert(content);
        });

        //커뮤니티 가짜 게시물 저장.
        IntStream.rangeClosed(1, 100).forEach(num -> {
            Content content = new Content();
            content.setUserEmail("dummy@gmail.com");
            content.setTitle("매퍼테스트제목커뮤니티"+num);
            content.setBody("매퍼테스트내용커뮤니티"+num);
            content.setCategoryId(1L);
            mapper.insert(content);
        });
    }

	@Test
	public void tesGetList() {
		List<Content> list = mapper.getList(2L);
		list.stream().forEach(content -> log.info(content));
	}
}