package kr.zalbazo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.hospital.HospitalMapper;
import kr.zalbazo.model.content.Hospital;
import kr.zalbazo.model.content.Label;
import kr.zalbazo.model.content.Picture;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class HospitalServiceImpl implements HospitalService{
	
	@Autowired
	HospitalMapper mapper;

	@Override
	public Hospital get(Long id) {
		return mapper.read(id);
	}

	@Override
	public List<Label> getLabelList(Long id) {
		return mapper.labelList(id);
	}

	@Override
	public List<Picture> getPictureList(Long id) {
		return mapper.pictureList(id);
	}

}
