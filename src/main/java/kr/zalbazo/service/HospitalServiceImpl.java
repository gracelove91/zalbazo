package kr.zalbazo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.content.HospitalMapper;
import kr.zalbazo.model.content.Criteria;
import kr.zalbazo.model.content.Hospital;
import kr.zalbazo.model.content.Label;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class HospitalServiceImpl implements HospitalService {

    @Autowired
    private HospitalMapper mapper;

	@Override
	public List<Hospital> getList() {
		return mapper.getList();
	}

	@Override
	public List<Label> getLabelList(Long hospitalId) {
		// TODO Auto-generated method stub
		return mapper.getLabelList(hospitalId);
	}


   
}
