package kr.zalbazo.controller.hospital;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.zalbazo.model.hospital.HospitalLabel;
import kr.zalbazo.model.user.HospitalInfo;
import kr.zalbazo.service.user.HospitalJoinService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping({ "/hospital/*" })
@Controller
@Log4j
@AllArgsConstructor
public class HospitalJoinController {
	
	@Autowired
	private HospitalJoinService hJoinService;
	
	
    @GetMapping("/register")
    public String join(Model model, Principal principal) {
        model.addAttribute("userEmail", principal.getName());
        return "user/hospital/hospitaljoin";
    }
    

    @PostMapping("/register")
    //public String join(@Valid @ModelAttribute User user, BindingResult bindingResult, RedirectAttributes rttr) {
    public String join(HospitalInfo hospitalInfo, HospitalLabel hospitalLabel, 
    			RedirectAttributes rttr, HttpServletRequest request, MultipartFile[] uploadFile) {
//        if(bindingResult.hasErrors()){
//            return "user/userjoin";
//        }
    	System.out.println("aaaaaaaaaaaaaaaaaaaaaa: "+uploadFile);

    	hJoinService.hospitalInfoRegister(hospitalInfo);
    	
    	// form에 있는 selectbox에서 라벨들의 값을 받아온다 
    	String[] label = request.getParameterValues("label_info");
    	
    	// 반복문을 이용하여 HospitaLabel객체에 값을 넣어주고 메서드를 이용해서 디비에 insert
    	for(int i=0; i<label.length; i++) {
    		
    		HospitalLabel hL = new HospitalLabel();
    		hL.setLabelCode(Integer.parseInt(label[i]));
    		hL.setHospitalId(hospitalInfo.getHospitalId());
    		
    		hJoinService.labelInsert(hL);
    	}
    	
        //rttr.addFlashAttribute("email", user.getUserEmail());

        return "redirect:/index";
    }
    

    @RequestMapping("/jusoPopup")
    public String popup(@RequestParam(required = false) String roadFullAddr){
        System.out.println(roadFullAddr);
        return "user/jusoPopup";
    }

}
