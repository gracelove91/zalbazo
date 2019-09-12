package kr.zalbazo.service;

import java.util.List;


import kr.zalbazo.model.content.Criteria;
import kr.zalbazo.model.content.Hospital;
import kr.zalbazo.model.content.Label;
import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.PicLib;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalLabel;
import kr.zalbazo.model.hospital.HospitalQna;

public interface HospitalService {
	
    List<Hospital> getList();

	List<Label> getLabelList(Long hospitalId);

	Hospital get(Long hospitalId);
	// List<HospitalLabel> getLabelList(Long hospitalId);
	
	void hContentRegister(Content content);
	void hQnaRegister(HospitalQna hospitalQna);
	
	List<PicLib> getPictureList(Long hospitalId);
	int getPictureCount(Long hospitalId);

	List<Content> getHospitalQnaList(Long hospitalId);

}
