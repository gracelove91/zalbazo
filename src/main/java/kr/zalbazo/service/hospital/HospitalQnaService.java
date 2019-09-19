package kr.zalbazo.service.hospital;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.hospital.HospitalQnaVO;

public interface HospitalQnaService {

	public int insertHospitalQna(HospitalQnaVO hospitalQnaVO);
	
	public int removeQna(Long contentId);
	public int removeContent(Long contentId);
	
	public List<HospitalQnaVO> getQnaList(@Param("hospitalId") Long hospitalId);
	
	public HospitalQnaVO getANo(Long contentId);

}
