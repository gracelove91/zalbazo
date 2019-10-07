package kr.zalbazo.service.user;

import java.util.List;

import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.Label;
import kr.zalbazo.model.pic.AttachFileDTO;

public interface HospitalJoinService {
	
	void hospitalInfoRegister(Hospital hospital);
	void labelInsert(Label label);
	void picInsert(AttachFileDTO attachFile);
	Hospital get(String userEmail);
	int update(Hospital hospital);
	
    List<AttachFileDTO> getPicList(String userEmail);
	
	void modify(Hospital hospital);

}
