package kr.zalbazo.controller.content;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.Criteria;
import kr.zalbazo.model.content.PageDTO;
import kr.zalbazo.model.pic.AttachFileDTO;
import kr.zalbazo.service.content.ContentService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping({"/community/*"})
public class CommunityController {

    private static final Long COMMUNITY_CATEGORY_NUM = 1L;

    @Autowired
    private ContentService service;

    @GetMapping("/register")
    public String register(Model model, Principal principal){
        model.addAttribute("useremail", principal.getName());
        return "/community/register"; //WEB-INF/views/register.jsp
    }

    @PostMapping("/register")
    public String register(Content content, RedirectAttributes rttr) {
    	log.info("register : " + content);
    	if(content.getAttachList() != null) {
    		content.getAttachList().forEach(attach -> log.info(attach));
    	}
    	
    	if(content.getTitle().trim().isEmpty() == true || content.getBody().trim().isEmpty() == true) {
    		return "redirect:/community/register";
    	}
    	
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
        
        return "redirect:/community/list" + cri.getListLink();
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("contentId") Long contentId, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr){

    	List<AttachFileDTO> attachList = service.getAttachList(contentId);
    	
        if(service.remove(contentId)) {
        	deleteFiles(attachList);
        	
            rttr.addFlashAttribute("result", "success");
        }

        return "redirect:/community/list" + cri.getListLink();
    }
    
    
    @ResponseBody
    @GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<List<AttachFileDTO>> getAttachList(Long contentId) {
    	log.info("getAttachList " + contentId);
    	
    	return new ResponseEntity<>(service.getAttachList(contentId), HttpStatus.OK);
    }
    
    
    // 첨부파일 삭제 처리
    private void deleteFiles(List<AttachFileDTO> attachList) {
    	if(attachList == null || attachList.size() == 0) {
    		return;
    	}
    	
    	log.info("delete attach files...................");
    	log.info(attachList);
    	
    	attachList.forEach(attach ->{
    		try {
    			Path file = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+ "_" +attach.getFileName());
    			
    			Files.deleteIfExists(file);
    			
    			Path thumbNail = Paths.get("C:\\upload\\" +attach.getUploadPath()+ "\\s_" + attach.getUuid() +"_"+ attach.getFileName());
    			Files.delete(thumbNail);
    		} catch (Exception e) {
    			log.error("delete file error" +e.getMessage());
			}
    	});
    }

}
