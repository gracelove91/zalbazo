package kr.zalbazo.controller.content;

import lombok.extern.log4j.Log4j;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "file:src/main/webapp/WEB-INF/root-context.xml",
        "file:src/main/webapp/WEB-INF/servlet-context.xml"
})
@WebAppConfiguration
@Log4j
public class JisikDongControllerTest {

    @Autowired
    private WebApplicationContext ctx;

    private MockMvc mockMvc;


    @Before
    public void setUp() throws Exception {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }


    @Test
    public void testMockMvc(){
        log.info(mockMvc);
    }

    @Test
    public void testModify() throws Exception {
    	String resultPage = mockMvc
    			.perform(MockMvcRequestBuilders.post("/jisikdong/modify")
    				.param("id", "1")
    				.param("title", "수정수정")
    				.param("body", "수정수정")
    				.param("userEmail", "dummy@gmail.com")
    				.param("categoryId", "2"))
    			.andReturn().getModelAndView().getViewName();
    	
    	log.info(resultPage);
    }


}