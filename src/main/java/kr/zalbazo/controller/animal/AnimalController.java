package kr.zalbazo.controller.animal;

import kr.zalbazo.model.animal.Animal;
import kr.zalbazo.service.animal.AnimalService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@Log4j
@RequestMapping("/user/mypage")
public class AnimalController {

    @Autowired
    private AnimalService service;

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
    public String modify(@RequestParam("id") Long animalId, Model model, Animal animal){


        model.addAttribute("animal",service.get(animalId));
        System.out.println(animalId);
        return "/user/mypage/animal/modify";

    }

    @PostMapping("/animal/modify")
    public String modify(Animal animal, RedirectAttributes rttr){

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
}
