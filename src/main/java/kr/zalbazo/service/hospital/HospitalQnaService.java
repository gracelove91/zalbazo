package kr.zalbazo.service.hospital;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.Authentication;

import kr.zalbazo.model.hospital.HospitalQnaVO;

public interface HospitalQnaService {

	public int insertQuestion(HospitalQnaVO hospitalQnaVO, Authentication auth);
	public int insertAnswer(HospitalQnaVO hospitalQnaVO);
	
	public int removeQnA(Long contentId);
	public int removeA(Long contentId);
	
	public List<HospitalQnaVO> getQnaList(@Param("hospitalId") Long hospitalId);

}
