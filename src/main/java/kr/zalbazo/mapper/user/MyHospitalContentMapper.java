package kr.zalbazo.mapper.user;

import java.util.List;

import kr.zalbazo.model.hospital.HospitalQnaVO;

public interface MyHospitalContentMapper {
	
	public List<HospitalQnaVO> getHospitalQList(String userEmail);
	
	// 병원의 A달기
	public int insertAnswer(HospitalQnaVO hospitalQnaVO);
	// A 삭제
	public int removeContent(Long contentId);

}
