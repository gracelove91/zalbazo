package kr.zalbazo.service.hospital;

import java.util.List;

import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.user.User;

public interface HospitalService {
	
	Hospital get(Long hospitalId);
	
	List<Hospital> getList();
	
}
