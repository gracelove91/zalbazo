package kr.zalbazo.mapper.hospital;

import java.util.List;

import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.Label;
import kr.zalbazo.model.pic.AttachFileDTO;
import kr.zalbazo.model.user.User;

public interface HospitalMapper {
	
	Hospital get(Long hospitalId);
	List<Label> labelList(Long hospitalId);
	List<AttachFileDTO> pictureList(Long hospitalId);
	
	List<Hospital> getList();
	int picCount(Long hospitalId);
	List<AttachFileDTO> picOne(Long hospitalId);
	
}
