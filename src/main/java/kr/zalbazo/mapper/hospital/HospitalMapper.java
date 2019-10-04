package kr.zalbazo.mapper.hospital;

import java.util.List;

import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalListVO;
import kr.zalbazo.model.hospital.Label;
import kr.zalbazo.model.pic.PicLib;

public interface HospitalMapper {
	
	Hospital read(Long hospitalId);
	
	List<HospitalListVO> getList();
	
	List<PicLib> pictureList(Long hospitalId);
	int hPictureCount(Long hospitalId);
	PicLib getPicOne(Long hospitalId);
	
	//List<Content> hospitalQnaList(Long hospitalId);

	//List<Hospital> getList();

	List<Label> getLabelList(Long hospitalId);
	
}
