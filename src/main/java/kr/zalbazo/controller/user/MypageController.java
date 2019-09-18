package kr.zalbazo.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.zalbazo.model.animal.Animal;
import kr.zalbazo.model.favorite_hospital.FavoriteHospital;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.service.hospital.HospitalService;
import kr.zalbazo.service.user.mypage.AnimalService;
import kr.zalbazo.service.user.mypage.FavoriteHospitalService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/mypage")
public class MypageController {
	
	@Autowired
    private AnimalService service;
	
	@Autowired
	private FavoriteHospitalService favoriteHospital_service;
	
	@Autowired
	private HospitalService hospitalService;

    @PostMapping("/animal/register")
    public String register(Animal animal){
      
        service.register(animal);
        
       
        
        return "redirect:/user/mypage/animal/list";
    }
    
    @GetMapping("/animal/register")
    public String register(){
    	
    
    	return "/user/mypage/animal/register";
    }

    @RequestMapping("/animal/list")
    public String list(Model model, Animal animal){


    	model.addAttribute("AnimalList", service.getList());
    	
    	return "/user/mypage/animal/list";
    }


    @GetMapping("/animal/modify")
    public String modify(@RequestParam("id") Long animalId, Model model,Animal animal){
        
    	
    	model.addAttribute("animal",service.get(animalId));
    	System.out.println(animalId);
    	return "/user/mypage/animal/modify";
    	
    }

    @PostMapping("/animal/modify")
    public String modify(Animal animal,RedirectAttributes rttr){

       service.modify(animal);
       rttr.addFlashAttribute("result", "success");
       
        return "redirect:/user/mypage/animal/list";
    }

    @RequestMapping("/animal/remove")
    public String remove(@RequestParam("id") Long animalId, RedirectAttributes rttr,Animal animal){
    	
        service.remove(animalId);
        rttr.addFlashAttribute("result", "success");
       
        return "redirect:/user/mypage/animal/list";
    }
    
    
    @RequestMapping("/favorite_hospital/remove")
    public String fh_remove(@RequestParam("id") Long hospitalId, RedirectAttributes rttr, FavoriteHospital favoriteHospital){
    	
    	favoriteHospital_service.remove(hospitalId);
    	rttr.addFlashAttribute("result", "success");
    	
    	return "redirect:/user/mypage/favorite_hospital/list";
    }
    
    @RequestMapping("/favorite_hospital/list")
    public String fh_list(Model model, Hospital hospital, FavoriteHospital favoriteHospital){
    	
    	favoriteHospital.setUserEmail("dummy@gmail.com");
    	favoriteHospital.setHospitalId(1L);
    	
    	List<Hospital> hospitalList = hospitalService.getList();
    	model.addAttribute("hospitalList", hospitalList);
    	model.addAttribute("favoriteHospitalList", favoriteHospital_service.getList(favoriteHospital));
    	
    	model.addAttribute("userEmail", "dummy@gmail.com");
		
    	return "/user/mypage/favorite_hospital/list";
    }
    
   
    
    
    
    
}