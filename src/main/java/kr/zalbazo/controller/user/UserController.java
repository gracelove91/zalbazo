package kr.zalbazo.controller.user;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.zalbazo.mapper.user.UserMapper;
import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.user.User;
import kr.zalbazo.service.content.ContentService;
import kr.zalbazo.service.user.UserService;
import kr.zalbazo.validator.UserValidator;
import lombok.extern.log4j.Log4j;

@RequestMapping({"/user/*"})
@Controller
@Log4j
@SessionAttributes("user")
public class UserController {
    @Autowired
    private UserService service;
    @Autowired
    private ContentService content_service;
    
   @Autowired
   UserMapper mapper;

    @InitBinder
    public void validator(WebDataBinder webDataBinder){
        webDataBinder.setValidator(new UserValidator(this.service));
    }
    
    @GetMapping("/register_select")
    public String register_select() {
       return "/register_select";
    }
    
    @GetMapping("/mypage")
    public String mypage(Authentication authentication, Model model) {
       
       User user = service.getUser(authentication.getName());
       
       if(authentication.getAuthorities().toString().equals("[ROLE_user]")) {
          model.addAttribute("useremail", authentication.getName());
           model.addAttribute("name", user.getName());
           System.out.println("유저는 유저마이페이지로! : " + authentication.getAuthorities());
           return "user/mypage";
       }
       
       if(authentication.getAuthorities().toString().equals("[ROLE_hospital]")) {
          model.addAttribute("useremail", authentication.getName());
           model.addAttribute("name", user.getName());
           System.out.println("병원은 병원마이페이지로! : " + authentication.getAuthorities());
           return "user/myhospitalpage";
       }
       
       // admin
       //model.addAttribute("useremail", authentication.getName());
       model.addAttribute("name", user.getName());
       System.out.println("admin이라면!!!!");
       return "user/adminpage";
    }
    
    @GetMapping("/register")
    public String join(@RequestParam String type, Model model) {

        model.addAttribute("user",new User());

        if(type.equals("hospital")){
            return "user/join/hospitaljoin";
        }
        return "user/join/userjoin";
    }

    @PostMapping("/register")
    public String join(@Valid @ModelAttribute User user, BindingResult bindingResult) {
        String type = user.getRole();

        if(bindingResult.hasErrors()){
            if(type.equals("hospital")){
                return "user/join/hospitaljoin";
            }

            return "user/join/userjoin";
        }

        if(type.equals("user")){
            service.register(user);
        }

        if(type.equals("hospital")) {
            return "redirect:/hospitalinfo/register";
        }

        return "redirect:/index";
    }

    @RequestMapping("/jusoPopup")
    public String popup(@RequestParam(required = false) String roadFullAddr) {
        System.out.println(roadFullAddr);
        return "user/jusoPopup";
    }

    //http://localhost:8080/user/emailConfirm?userEmail=asdf&emailAuthKey=xcxz
    @GetMapping("/emailConfirm")
    public String emailConfirm(@RequestParam String userEmail, @RequestParam String emailAuthKey, RedirectAttributes rttr) {
        log.info(userEmail);
        log.info(emailAuthKey);

        boolean enabled = service.updateEnabled(userEmail);

        if(enabled){
            rttr.addFlashAttribute("email", userEmail);
            return "redirect:/login";
        }else {
            throw new HttpClientErrorException(HttpStatus.NOT_FOUND);
        }
    }
    
    
	@GetMapping(value= "/get", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity <User> getUser(Model model, Principal principal) {
		return new ResponseEntity<>(service.getUser(principal.getName()), HttpStatus.OK);
	}
	
	@GetMapping(value= "/getWriter/{contentId}", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity <Content> getWriter(@PathVariable("contentId") Long contentId) {
		log.info("aaaaaaa: "  + contentId);
		return new ResponseEntity<>(service.getWriter(contentId), HttpStatus.OK);
	}
   
}
