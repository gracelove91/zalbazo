package kr.zalbazo.service;

import java.util.List;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.Hospital;
import kr.zalbazo.model.content.HospitalLabel;
import kr.zalbazo.model.content.HospitalQna;
import kr.zalbazo.model.content.PicLib;

public interface HospitalService {
	
	Hospital get(Long hospitalId);
	List<HospitalLabel> getLabelList(Long hospitalId);
	
	void hContentRegister(Content content);
	void hQnaRegister(HospitalQna hospitalQna);
	
	List<PicLib> getPictureList(Long hospitalId);
	int getPictureCount(Long hospitalId);

	List<Content> getHospitalQnaList(Long hospitalId);
}
