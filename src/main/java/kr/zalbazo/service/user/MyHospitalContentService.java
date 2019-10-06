package kr.zalbazo.service.user;

import java.util.List;

import kr.zalbazo.model.hospital.HospitalQnaVO;

public interface MyHospitalContentService {
	
	public List<HospitalQnaVO> getHospitalQList(String userEmail);
	
	// 병원의 A달기
	public int insertAnswer(HospitalQnaVO hospitalQnaVO);
	public int removeA(Long contentId);

}
