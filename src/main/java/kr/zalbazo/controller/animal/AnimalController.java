package kr.zalbazo.controller.animal;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.zalbazo.model.animal.Animal;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.service.animal.AnimalService;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/user/mypage")
public class AnimalController {

    @Autowired
    private AnimalService service;

    @PostMapping("/animal/register")
    public String register(Animal animal){

        service.register(animal);
        return "redirect:/user/mypage";
    }
    
    @PostMapping("/animal/list")
    public String list(){
    	
    	return "/user/mypage/animal/list";
    }

    @GetMapping("/animal/register")
    public String register(@RequestParam String userEmail, Model model) {
    	
    		model.addAttribute("userEmail", userEmail);

        return "/user/mypage/animal/register";
    }


    @GetMapping("/animal/modify")
    public String modify(@RequestParam("id") Long animalId, Model model, Animal animal){


        model.addAttribute("animal",service.get(animalId));
        System.out.println(animalId);
        return "/user/mypage/animal/modify";

    }

    @PostMapping("/animal/modify")
    public String modify(Animal animal, RedirectAttributes rttr){

        service.modify(animal);
        rttr.addFlashAttribute("result", "success");

        return "redirect:/user/mypage";
    }

    @RequestMapping("/animal/remove")
    public String remove(@RequestParam("id") Long animalId, RedirectAttributes rttr,Animal animal){

        service.remove(animalId);
        rttr.addFlashAttribute("result", "success");

        return "redirect:/user/mypage";
    }
    
    @ResponseBody
 	@GetMapping(value = "/animal_list", produces = { 
 			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
 	public ResponseEntity<List<Animal>> getList(Principal principal) {
 		
 		return new ResponseEntity<>(service.getList(principal.getName()), HttpStatus.OK);
 	}
    
}
