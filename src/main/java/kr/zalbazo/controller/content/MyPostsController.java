package kr.zalbazo.controller.content;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.service.content.MypostsService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user")
public class MyPostsController {
	
	@Autowired
	MypostsService service;
	
	private static final Long JISIKDONG_CATEGORY_NUM = 2L;

    @RequestMapping("/mypage")
    public String list(Principal principal, Long categoryId, Model model, Content content){
    	    	    	
    	System.out.println("컨텐츠 ");
    	
    	categoryId = JISIKDONG_CATEGORY_NUM;
    	System.out.println(categoryId);

    	System.out.println(service);

    	model.addAttribute("useremail", principal.getName());
    	model.addAttribute("MypostsList", service.getJisikdongList(categoryId));
    	
    	return "/user/mypage";
    }
    
    //@GetMapping("/mypage")
    //public String mypage(Principal principal, Model model) {
    //	model.addAttribute("useremail", principal.getName());
    //	return "user/mypage";
    //}
    
//    @RequestMapping("/myposts/list")
//    public String list2() {
//    	return "/user/mypage/myposts/list";
//    }
//    


    
}