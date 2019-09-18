package kr.zalbazo.service.hospital;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.hospital.HospitalReviewMapper;
import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.hospital.HospitalReviewVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HospitalReviewServiceImpl implements HospitalReviewService {
	
	@Setter(onMethod_= @Autowired)
	private HospitalReviewMapper reviewMapper;

	@Override
	public List<HospitalReviewVO> getReviewList(Long hospitalId) {
		return reviewMapper.getReviewList(hospitalId);
	}

	@Override
	public double get(Long hospitalId) {
		return reviewMapper.get(hospitalId);
	}

	@Override
	public double insertContent(Content content) {
		return reviewMapper.insertContent(content);
	}

	@Override
	public double insertReview(HospitalReviewVO hospitalReviewVO) {
		return reviewMapper.insertReview(hospitalReviewVO);
	}

}
