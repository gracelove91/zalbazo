package kr.zalbazo.controller.content;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.service.content.MypostsService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/mypage")
public class MyPostsController {
	
	@Autowired
	MypostsService service;
	
	private static final Long JISIKDONG_CATEGORY_NUM = 2L;

    @RequestMapping("/myposts/list")
    public String list(Long categoryId, Model model, Content content){
    	    	    	
    	System.out.println("컨텐츠 ");
    	
    	categoryId = JISIKDONG_CATEGORY_NUM;
    	System.out.println(categoryId);

    	System.out.println(service);

    	model.addAttribute("MypostsList", service.getJisikdongList(categoryId));
    	
    	return "/user/mypage/myposts/list";
    }
    
//    @RequestMapping("/myposts/list")
//    public String list2() {
//    	return "/user/mypage/myposts/list";
//    }
//    


    
}