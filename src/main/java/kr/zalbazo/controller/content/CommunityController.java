package kr.zalbazo.controller.content;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.Criteria;
import kr.zalbazo.model.content.PageDTO;
import kr.zalbazo.service.content.ContentService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Log4j
@RequestMapping({"/community/*"})
public class CommunityController {

    private static final Long COMMUNITY_CATEGORY_NUM = 1L;

    @Autowired
    private ContentService service;

    @GetMapping("/register")
    public String register(){
        return "/community/register"; //WEB-INF/views/register.jsp
    }

    @PostMapping("/register")
    public String register(Content content, RedirectAttributes rttr){
        content.setCategoryId(COMMUNITY_CATEGORY_NUM);
        service.register(content);
        rttr.addFlashAttribute("result", content);
        return "redirect:/community/list";
    }


    @GetMapping("/list")
    public void list(Criteria cri, Model model){
        cri.setCategory(COMMUNITY_CATEGORY_NUM);
        model.addAttribute("contentList", service.getList(cri));
        service.getList(cri).stream().forEach(System.out::println);
        int total = service.getTotal(cri);
        log.info("list : " + cri);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
    }

    @GetMapping({"/get", "/modify"})
    public void detail(@RequestParam("contentId") Long contentId, Model model, @ModelAttribute("cri") Criteria cri){
        model.addAttribute("content", service.get(contentId));
    }
    
    @PostMapping("/modify")
    public String modify(Content content, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri){

        if(service.modify(content)){
            rttr.addFlashAttribute("result", "success");
        }
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        
        return "redirect:/community/list";
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("contentId") Long contentId, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri){
    	
        if(service.remove(contentId)){
            rttr.addFlashAttribute("result", "success");
        }
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        return "redirect:/community/list";
    }

}
