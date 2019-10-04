package kr.zalbazo.service.hospital;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.hospital.HospitalMapper;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalListVO;
import kr.zalbazo.model.hospital.Label;
import kr.zalbazo.model.pic.PicLib;
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
	public List<Label> getLabelList(Long hospitalId) {
		return mapper.getLabelList(hospitalId);
	}

//	@Override
//	public List<Content> getHospitalQnaList(Long hospitalId) {
//		return mapper.hospitalQnaList(hospitalId);
//	}

	@Override
	public List<PicLib> getPictureList(Long hospitalId) {
		return mapper.pictureList(hospitalId);
	}

	@Override
	public int getPictureCount(Long hospitalId) {
		return mapper.hPictureCount(hospitalId);
	}


	@Override
	public List<HospitalListVO> getList() {
		return mapper.getList();
	}

	@Override
	public PicLib getPicOne(Long hospitalId) {
		return mapper.getPicOne(hospitalId);
	}
}
