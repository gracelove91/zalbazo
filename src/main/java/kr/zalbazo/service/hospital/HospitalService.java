package kr.zalbazo.service.hospital;

import java.util.List;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalLabel;
import kr.zalbazo.model.hospital.HospitalListVO;
import kr.zalbazo.model.hospital.HospitalQnaVO;
import kr.zalbazo.model.pic.PicLib;

public interface HospitalService {
	
	Hospital get(Long hospitalId);
	
	List<HospitalLabel> getLabelList(Long hospitalId);
	
	void hContentRegister(Content content);
	void hQnaRegister(HospitalQnaVO hospitalQnaVO);
	
	List<PicLib> getPictureList(Long hospitalId);
	int getPictureCount(Long hospitalId);
	PicLib getPicOne(Long hospitalId);

	//List<Content> getHospitalQnaList(Long hospitalId);

	List<HospitalListVO> getList();
}