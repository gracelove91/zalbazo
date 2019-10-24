package kr.zalbazo.mapper.hospital;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.zalbazo.model.hospital.HospitalQnaVO;

public interface HospitalQnaMapper {

	public List<HospitalQnaVO> getQnaList(@Param("hospitalId") Long hospitalId);

	public int insertQuestion(HospitalQnaVO hospitalQnaVO);
	public int insertAnswer(HospitalQnaVO hospitalQnaVO);
	
	public int deleteContent(Long contentId);
	
	public HospitalQnaVO getANo(Long contentId);

}
