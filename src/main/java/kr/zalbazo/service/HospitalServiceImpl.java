package kr.zalbazo.service;

import kr.zalbazo.mapper.hospital.HospitalMapper;
import kr.zalbazo.model.content.*;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalLabel;
import kr.zalbazo.model.hospital.HospitalQna;
import kr.zalbazo.model.pic.PicLib;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class HospitalServiceImpl implements HospitalService{
	
	@Autowired
	HospitalMapper mapper;

	@Override
	public Hospital get(Long hospitalId) {
		return mapper.read(hospitalId);
	}

	@Override
	public List<HospitalLabel> getLabelList(Long hospitalId) {
		return mapper.labelList(hospitalId);
	}

	@Override
	public List<Content> getHospitalQnaList(Long hospitalId) {
		return mapper.hospitalQnaList(hospitalId);
	}

	@Override
	public List<PicLib> getPictureList(Long hospitalId) {
		return mapper.pictureList(hospitalId);
	}

	@Override
	public int getPictureCount(Long hospitalId) {
		return mapper.hPictureCount(hospitalId);
	}

	@Override
	public void hContentRegister(Content content) {
		mapper.hContentInsert(content);
	}

	@Override
	public void hQnaRegister(HospitalQna hospitalQna) {
		mapper.hQnaInsert(hospitalQna);
	}

	@Override
	public List<Hospital> getList() {
		return mapper.getList();
	}
}
