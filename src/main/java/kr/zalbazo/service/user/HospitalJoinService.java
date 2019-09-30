package kr.zalbazo.service.user;

import kr.zalbazo.model.hospital.HospitalLabel;
import kr.zalbazo.model.pic.AttachFileDTO;
import kr.zalbazo.model.user.HospitalInfo;

public interface HospitalJoinService {
	
	void hospitalInfoRegister(HospitalInfo hospitalInfo);
	void labelInsert(HospitalLabel hospitalLabel);
	void picInsert(AttachFileDTO attachFile);

}
