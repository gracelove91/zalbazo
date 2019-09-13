package kr.zalbazo.service;

import java.util.List;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalLabel;
import kr.zalbazo.model.hospital.HospitalQna;
import kr.zalbazo.model.pic.PicLib;

public interface HospitalService {
	
	Hospital get(Long hospitalId);
	
	List<HospitalLabel> getLabelList(Long hospitalId);
	
	void hContentRegister(Content content);
	void hQnaRegister(HospitalQna hospitalQna);
	
	List<PicLib> getPictureList(Long hospitalId);
	int getPictureCount(Long hospitalId);

	List<Content> getHospitalQnaList(Long hospitalId);
	

    List<Hospital> getList();
//
//	List<Label> getLabelList(Long hospitalId);
}
