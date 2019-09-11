package kr.zalbazo.mapper.hospital;

import java.util.List;

import kr.zalbazo.model.content.Hospital;
import kr.zalbazo.model.content.Label;
import kr.zalbazo.model.content.Picture;

public interface HospitalMapper {
	
	Hospital read(Long id);
	List<Label> labelList(Long id);
	List<Picture> pictureList(Long id);

}
