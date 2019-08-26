package kr.zalbazo.controller;

import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/root-context.xml")
public class BasicControllerTest {

    @Autowired
    private BasicController basicController;

    private MockMvc mockMvc;


    @Before
    public void setUp(){
        this.mockMvc = MockMvcBuilders.standaloneSetup(basicController).build();
    }

}