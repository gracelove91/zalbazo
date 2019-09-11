package kr.zalbazo.service;

import java.util.List;

import kr.zalbazo.model.content.Criteria;
import kr.zalbazo.model.content.Hospital;
import kr.zalbazo.model.content.Label;

public interface HospitalService {
	
    List<Hospital> getList();

	List<Label> getLabelList(Long hospitalId);
}
