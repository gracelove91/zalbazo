package kr.zalbazo.service.hospital;

import java.util.List;

import kr.zalbazo.model.hospital.Hospital;

public interface HospitalService {
	
	Hospital get(Long hospitalId);
	
	List<Hospital> getList();
	
}
