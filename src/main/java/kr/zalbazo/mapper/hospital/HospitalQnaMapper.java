package kr.zalbazo.mapper.hospital;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.hospital.HospitalQna;

public interface HospitalQnaMapper {
	
	public int insertContent(Content content);
	public int insertQna(HospitalQna hospitalQna);
	
	public int deleteQna(Long contentId);
	public int deleteContent(Long contentId);
	
	public List<Content> getList(@Param("hospitalId") Long hospitalId);

}
