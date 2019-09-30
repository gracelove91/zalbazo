package kr.zalbazo.service.search;


import java.util.List;

import kr.zalbazo.model.hospital.Hospital;

public interface SearchService {

	// 05. 게시글 전체 목록 ==> 검색옵션, 키워드 매개변수 추가
	public List<Hospital> listAll(String searchOption, String keyword,String[] label,String length) throws Exception;
	
	public List<Hospital> list(String keyword) throws Exception;
	
	
//	// 07. 게시글 레코드 갯수 메서드 추가
//	public int countArticle(String searchOption, String keyword) throws Exception;
}
