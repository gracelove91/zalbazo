package kr.zalbazo.service.hospital;

import java.util.List;

import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalListVO;
import kr.zalbazo.model.hospital.Label;
import kr.zalbazo.model.pic.PicLib;

public interface HospitalService {
	
	Hospital get(Long hospitalId);
	
	List<Label> getLabelList(Long hospitalId);
	
	List<PicLib> getPictureList(Long hospitalId);
	int getPictureCount(Long hospitalId);
	PicLib getPicOne(Long hospitalId);

	List<HospitalListVO> getList();
}
