package kr.zalbazo.mapper.hospital;

import java.util.List;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalLabel;
import kr.zalbazo.model.hospital.HospitalQnaVO;
import kr.zalbazo.model.pic.PicLib;

public interface HospitalMapper {
	
	Hospital read(Long hospitalId);
	List<HospitalLabel> labelList(Long hospitalId);
	
	void hContentInsert(Content content);
	void hQnaInsert(HospitalQnaVO hospitalQnaVO);
	
	List<PicLib> pictureList(Long hospitalId);
	int hPictureCount(Long hospitalId);
	
	//List<Content> hospitalQnaList(Long hospitalId);

	List<Hospital> getList();

	List<HospitalLabel> getLabelList(Long hospitalId);
	
}
