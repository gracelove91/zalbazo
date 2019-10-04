package kr.zalbazo.controller.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.zalbazo.mapper.hospital.HospitalMapper;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.service.search.SearchService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class SearchController {

	@Autowired
	private SearchService service;
	@Autowired
	private HospitalMapper hospitalMapper;


	@GetMapping("/hospital/searchedlistAll")
	public ModelAndView in(@RequestParam(defaultValue = "name") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "") String[] label, @RequestParam(defaultValue = "") String length) throws Exception {
		
		List<Hospital> list = service.listAll(searchOption, keyword,label,length); //라벨 문자열배열을 쿼리문으로 짜기 쉽게 리스트로 변환  
		
		
		//병원별 라벨 값 세팅
		for (int i = 0; i < list.size(); i++) {
			Hospital hospital = list.get(i);
			hospital.setLabel(hospitalMapper.labelList(hospital.getHospitalId()));
		}

		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("hospital/searchedlist"); // 뷰를 list.jsp로 설정
		return mav; // list.jsp로 List가 전달된다.
	}
	
	@GetMapping("/hospital/searchedlist")
	public ModelAndView in(@RequestParam(defaultValue = "") String keyword) throws Exception {
		
		List<Hospital> list = service.list(keyword); //라벨 문자열배열을 쿼리문으로 짜기 쉽게 리스트로 변환  
		for (int i = 0; i < list.size(); i++) {
			Hospital hospital = list.get(i);
			hospital.setLabel(hospitalMapper.labelList(hospital.getHospitalId()));
		}
		
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("hospital/searchedlist"); // 뷰를 list.jsp로 설정
		return mav; // list.jsp로 List가 전달된다.
	}

}

