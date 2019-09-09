package kr.zalbazo.service;

import java.util.List;

import kr.zalbazo.model.content.Hospital;
import kr.zalbazo.model.content.Label;
import kr.zalbazo.model.content.Picture;

public interface HospitalService {
	
	Hospital get(Long id);
	List<Label> getLabelList(Long id);
	List<Picture> getPictureList(Long id);

}
