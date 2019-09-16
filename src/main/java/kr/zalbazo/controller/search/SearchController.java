package kr.zalbazo.controller.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.service.search.SearchService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class SearchController {

	@Autowired
	private SearchService service;

//  @GetMapping("/in")
//  public ModelAndView in2(@RequestParam(defaultValue="title") String searchOption,
//	        @RequestParam(defaultValue="") String keyword)throws Exception{
//	  List<Hospital> list = service.list();
//	  ModelAndView mav = new ModelAndView();
//	  Map<String, Object> map = new HashMap<String, Object>();
//	  map.put("list", list); // list
//	  mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
//	  mav.setViewName("NewFile"); // 뷰를 list.jsp로 설정
//	  return mav; // list.jsp로 List가 전달된다.
//  }

	@PostMapping("/hospital/searchedlist")
	public ModelAndView in(@RequestParam(defaultValue = "name") String searchOption,
			@RequestParam(defaultValue = "") String keyword) throws Exception {
		List<Hospital> list = service.listAll(searchOption, keyword);
		System.out.println(searchOption);
		System.out.println(keyword);
// ModelAndView - 모델과 뷰
		ModelAndView mav = new ModelAndView();
		/*
		 * mav.addObject("list", list); // 데이터를 저장 mav.addObject("count", count);
		 * mav.addObject("searchOption", searchOption); mav.addObject("keyword",
		 * keyword);
		 */
// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("searchOption", searchOption); // 검색옵션
		map.put("keyword", keyword); // 검색키워드
		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("hospital/searchedlist"); // 뷰를 list.jsp로 설정
		return mav; // list.jsp로 List가 전달된다.
	}

}
