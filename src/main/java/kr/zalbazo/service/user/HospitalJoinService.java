package kr.zalbazo.service.user;

import kr.zalbazo.model.hospital.HospitalLabel;
import kr.zalbazo.model.user.HospitalInfo;

public interface HospitalJoinService {
	
	void hospitalInfoRegister(HospitalInfo hospitalInfo);
	void labelInsert(HospitalLabel hospitalLabel);

}
