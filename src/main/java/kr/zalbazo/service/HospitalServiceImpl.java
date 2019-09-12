package kr.zalbazo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.hospital.HospitalMapper;
import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.Hospital;
import kr.zalbazo.model.content.HospitalLabel;
import kr.zalbazo.model.content.HospitalQna;
import kr.zalbazo.model.content.PicLib;
import lombok.extern.log4j.Log4j;

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
