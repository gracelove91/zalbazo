package kr.zalbazo.service.hospital;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.hospital.HospitalReviewVO;

public interface HospitalReviewService {
	
	public List<HospitalReviewVO> getReviewList(@Param("hospitalId") Long hospitalId);
	
	public double get(@Param("hospitalId") Long hospitalId);
	
	public int insertReview(HospitalReviewVO hospitalReviewVO);

}
