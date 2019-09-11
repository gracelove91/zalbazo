package kr.zalbazo.mapper.hospital;

import java.util.List;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.Hospital;
import kr.zalbazo.model.content.HospitalLabel;
import kr.zalbazo.model.content.HospitalQna;
import kr.zalbazo.model.content.PicLib;

public interface HospitalMapper {
	
	Hospital read(Long hospitalId);
	List<HospitalLabel> labelList(Long hospitalId);
	
	void hContentInsert(Content content);
	void hQnaInsert(HospitalQna hospitalQna);
	
	List<PicLib> pictureList(Long hospitalId);
	int hPictureCount(Long hospitalId);
	
	List<Content> hospitalQnaList(Long hospitalId);
	
}
