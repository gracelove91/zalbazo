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
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	
    @GetMapping("/register")
    public String join(Model model, Principal principal) {
        model.addAttribute("userEmail", principal.getName());
        return "user/hospital/hospitaljoin";
    }
    

    @PostMapping("/register")
    public String join(@Valid HospitalInfo hospitalInfo, HospitalLabel hospitalLabel, User user,
    			RedirectAttributes rttr, HttpServletRequest request, BindingResult bindingResult) {

    	if(bindingResult.hasErrors()) {
    		System.out.println("에러발생");
    		return "/hospitalinfo/register";
    	}
    	
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
    	
        rttr.addFlashAttribute("email", user.getUserEmail());

        return "redirect:/index";
    }
    
    
	@ResponseBody
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload\\hospital\\";
		
		int i = 1;
				
		for(MultipartFile multipartFile : uploadFile) {
			
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//log.info("uploadFileName : "+uploadFileName);
			
			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			
			String ext = uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1).toLowerCase();
			
			uploadFileName = i +"."+ ext;
			log.info("only file name : "+uploadFileName);
			attachDTO.setExt(ext);
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			attachDTO.setUuid(uuid.toString());
			
			try {
				File saveFile = new File(uploadFolder, uploadFileName);
				//File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUploadPath(uploadFolder);
				System.out.println("uploadFolder : " +uploadFolder);
				System.out.println("uploadFileName :"  +uploadFileName);
				
				// add to List
				list.add(attachDTO);
				i++;
				
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

    

    @RequestMapping("/jusoPopup")
    public String popup(@RequestParam(required = false) String roadFullAddr){
        System.out.println(roadFullAddr);
        return "user/jusoPopup";
    }

}
