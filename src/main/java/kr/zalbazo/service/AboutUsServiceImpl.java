package kr.zalbazo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.aboutus.AboutUsMapper;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalReviewVO;
import kr.zalbazo.model.user.Reserve;
import kr.zalbazo.model.user.User;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AboutUsServiceImpl implements AboutUsService{
	
	@Setter(onMethod_ = @Autowired)
	private AboutUsMapper aboutUsMapper;

	@Override
	public int reseveCount(Reserve reserve) {
		return aboutUsMapper.reseveCount(reserve);
	}

	@Override
	public int reviewCount(HospitalReviewVO hopitalReviewVO) {
		return aboutUsMapper.reviewCount(hopitalReviewVO);
	}

	@Override
	public int userCount(User user) {
		return aboutUsMapper.userCount(user);
	}

	@Override
	public int hospitalCount(Hospital hospital) {
		return aboutUsMapper.hospitalCount(hospital);
	}

	



}
