package kr.zalbazo.controller.hospital;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.service.hospital.FavoriteHospitalService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/mypage/*")
public class MyFavoriteHospitalController {

    @Autowired
    private FavoriteHospitalService favoriteHospital_service;

    @GetMapping("/favorite_hospital/remove")
   public String remove(@RequestParam("hospitalId") Long hospitalId, RedirectAttributes rttr, kr.zalbazo.model.favorite_hospital.FavoriteHospital favoriteHospital){
        favoriteHospital_service.remove(hospitalId);
        rttr.addFlashAttribute("result", "success");

        return "redirect:/user/mypage/favorite_hospital/list";
    }

	
    @GetMapping("/favorite_hospital/list")
    public String list(Model model, Long hospitalId, kr.zalbazo.model.favorite_hospital.FavoriteHospital favoriteHospital, Principal principal){

        favoriteHospital.setUserEmail(principal.getName());
        favoriteHospital.setHospitalId(1L);

        model.addAttribute("favoriteHospitalList", favoriteHospital_service.getList(favoriteHospital));

        model.addAttribute("userEmail", principal.getName());

        List<Hospital> favoriteHospitalList = favoriteHospital_service.getList(favoriteHospital);
        for (int i = 0; i < favoriteHospitalList.size(); i++) {
            Hospital hospital = favoriteHospitalList.get(i);
            hospital.setLabel(favoriteHospital_service.getLabelList(hospital.getHospitalId()));
        }

//        favoriteHospitalList.stream().forEach(System.out::println);

        model.addAttribute("favoriteHospitalList", favoriteHospitalList);
        
        return "/user/mypage/favorite_hospital/list";
    }
}
