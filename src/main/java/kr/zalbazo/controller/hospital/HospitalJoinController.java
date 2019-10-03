package kr.zalbazo.controller.hospital;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import kr.zalbazo.controller.user.UserController;
import kr.zalbazo.service.user.UserService;
import kr.zalbazo.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.zalbazo.model.hospital.HospitalLabel;
import kr.zalbazo.model.pic.AttachFileDTO;
import kr.zalbazo.model.user.HospitalInfo;
import kr.zalbazo.model.user.User;
import kr.zalbazo.service.user.HospitalJoinService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping({ "/hospitalinfo/*" })
@Controller
@Log4j
@AllArgsConstructor
public class HospitalJoinController {

	@Autowired
	private HospitalJoinService hJoinService;

	@Autowired
	private UserService userService;

    @GetMapping("/register")
    public String join(Model model, @SessionAttribute User user, Principal principal) {
		System.out.println(user);
		System.out.println("===========================================");
    	model.addAttribute("user", user);
        return "user/join/hospitaldetailjoin";
    }


    @PostMapping("/register")
    public String join(HospitalInfo hospitalInfo, HospitalLabel hospitalLabel, @ModelAttribute User user,
    			RedirectAttributes rttr, HttpServletRequest request) {
		user.setRole("hospital");


    	hJoinService.hospitalInfoRegister(hospitalInfo);
		user.setHospitalId(hospitalInfo.getHospitalId());
    	// form에 있는 selectbox에서 라벨들의 값을 받아온다
    	String[] label = request.getParameterValues("label_info");

    	// 반복문을 이용하여 HospitaLabel객체에 값을 넣어주고 메서드를 이용해서 디비에 insert
    	for(int i=0; i<label.length; i++) {

    		HospitalLabel hL = new HospitalLabel();
    		hL.setLabelCode(Integer.parseInt(label[i]));
    		hL.setHospitalId(hospitalInfo.getHospitalId());

    		hJoinService.labelInsert(hL);
    	}

		userService.register(user);


        rttr.addFlashAttribute("email", user.getUserEmail());

        return "redirect:/index";
    }
    
    
    @GetMapping("/get")
    public String get(Principal principal, Model model) {
    	
    	//아직 병원등록 메일 전송이 안돼서 principal 사용 아직 못함
    	//String userEmail = principal.getName();
    	//model.addAttribute("userEmail", principal.getName());
    	
    	String userEmail = "scienceos@naver.com";
    	model.addAttribute("info", hJoinService.get(userEmail));
    	log.info(hJoinService.get(userEmail));
    	
    	return "user/hospital/get";
    }
    
    
    @GetMapping("/modify")
    public String modify(Principal principal, Model model) {
    	
    	//아직 병원등록 메일 전송이 안돼서 principal 사용 아직 못함
    	//String userEmail = principal.getName();
    	//model.addAttribute("userEmail", principal.getName());
    	
    	String userEmail = "scienceos@naver.com";
    	model.addAttribute("info", hJoinService.get(userEmail));
    	
    	return "user/hospital/modify";
    }
    
    @PostMapping("/modify")
    public String update(HospitalInfo hospitalInfo, RedirectAttributes rttr) {
    	hJoinService.modify(hospitalInfo);
    	
    	if(hJoinService.modify(hospitalInfo)) {
    		log.info("ssssssssssssssssssssss");
    		rttr.addFlashAttribute("result", "success");
    	}
    	
    	return "redirect:/user/mypage";
    }
    

    
	@ResponseBody
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile, HttpServletRequest httpServletRequest) {

		String uploadFolder = httpServletRequest.getSession().getServletContext().getRealPath("/static-resources/img/hospital/");

		log.info("uploadFolder : " +uploadFolder);

		List<AttachFileDTO> list = new ArrayList<>();

		for(MultipartFile multipartFile : uploadFile) {

			AttachFileDTO attachDTO = new AttachFileDTO();

			String uploadFileName = multipartFile.getOriginalFilename();

			//log.info("uploadFileName : "+uploadFileName);

			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);

			log.info("only file name : "+uploadFileName);
			attachDTO.setFileName(uploadFileName);

			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			attachDTO.setUuid(uuid.toString());

			try {
				File saveFile = new File(uploadFolder, uploadFileName);
				//File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				attachDTO.setUploadPath(uploadFolder);

				// add to List
				list.add(attachDTO);

			} catch(Exception e) {
				log.error(e.getMessage());
			}
		} // end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}


	@ResponseBody
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("fileName : " + fileName);

		File file = new File(fileName);

		log.info("file : " + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch(IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> getPicList(String userEmail) {
		
		log.info("getPicList " + userEmail);
		
		return new ResponseEntity<>(hJoinService.getPicList(userEmail), HttpStatus.OK);
	}
	
	
	@ResponseBody
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {
		log.info("deleteFile : " + fileName);

		File file;

		try {
			file = new File(URLDecoder.decode(fileName, "UTF-8"));
			file.delete();

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
		
	}

	}



    @RequestMapping("/jusoPopup")
    public String popup(@RequestParam(required = false) String roadFullAddr){
        System.out.println(roadFullAddr);
        return "user/jusoPopup";
    }

}
