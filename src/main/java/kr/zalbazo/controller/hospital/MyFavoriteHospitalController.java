package kr.zalbazo.controller.hospital;

import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.service.hospital.FavoriteHospitalService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Log4j
@RequestMapping("/user/mypage")
public class MyFavoriteHospitalController {

    @Autowired
    private FavoriteHospitalService favoriteHospital_service;

	/*
	 * @PostMapping("/favorite_hospital/register") public String
	 * fh_register(kr.zalbazo.model.favorite_hospital.FavoriteHospital
	 * favoriteHospital){
	 * 
	 * favoriteHospital_service.register(favoriteHospital);
	 * 
	 * 
	 * 
	 * return "redirect:/user/mypage/favorite_hospital/list"; }
	 */
    
//    @GetMapping("/favorite_hospital/register")
//    public String fh_register(){
//
//
//    	return "/user/mypage/favorite_hospital/register";
//    }

    @RequestMapping("/favorite_hospital/remove")
    public String fh_remove(@RequestParam("id") Long hospitalId, RedirectAttributes rttr, kr.zalbazo.model.favorite_hospital.FavoriteHospital favoriteHospital){

        favoriteHospital_service.remove(hospitalId);
        rttr.addFlashAttribute("result", "success");

        return "redirect:/user/mypage/favorite_hospital/list";
    }

    @RequestMapping("/favorite_hospital/list")
    public String fh_list(Model model, Long hospitalId, kr.zalbazo.model.favorite_hospital.FavoriteHospital favoriteHospital){

        favoriteHospital.setUserEmail("dummy@gmail.com");
        favoriteHospital.setHospitalId(1L);

        model.addAttribute("favoriteHospitalList", favoriteHospital_service.getList(favoriteHospital));

        model.addAttribute("userEmail", "dummy@gmail.com");

        List<Hospital> favoriteHospitalList = favoriteHospital_service.getList(favoriteHospital);
        for (int i = 0; i < favoriteHospitalList.size(); i++) {
            Hospital hospital = favoriteHospitalList.get(i);
            hospital.setLabel(favoriteHospital_service.getLabelList(hospital.getHospitalId()));
        }

        model.addAttribute("favoriteHospitalList", favoriteHospitalList);

        return "/user/mypage/favorite_hospital/list";
    }
}
