package kr.zalbazo.service.user;

import java.util.List;

import kr.zalbazo.model.content.Label;
import kr.zalbazo.model.hospital.HospitalLabel;
import kr.zalbazo.model.pic.AttachFileDTO;
import kr.zalbazo.model.user.HospitalInfo;

public interface HospitalJoinService {
	
	void hospitalInfoRegister(HospitalInfo hospitalInfo);
	void labelInsert(HospitalLabel hospitalLabel);
	void picInsert(AttachFileDTO attachFile);
	HospitalInfo get(String userEmail);

}
