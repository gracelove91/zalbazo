package kr.zalbazo.service.user;

import kr.zalbazo.model.hospital.Hospital;

public interface HospitalJoinService {
	
	void insert(Hospital hospital);
	
	Hospital get(String userEmail);
	
	void modify(Hospital hospital);

}
