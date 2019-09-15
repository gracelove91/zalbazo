package kr.zalbazo.service.hospital;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.hospital.HospitalQna;

public interface HospitalQnaService {
	
	public int registerContent(Content content);
	public int registerQna(HospitalQna hospitalQna);
	
	public int removeQna(Long contentId);
	public int removeContent(Long contentId);
	
	public List<Content> getList(@Param("hospitalId") Long hospitalId);

}
