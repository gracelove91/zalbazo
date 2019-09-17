package kr.zalbazo.mapper.hospital;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.zalbazo.model.hospital.HospitalReviewVO;

public interface HospitalReviewMapper {
	
	public List<HospitalReviewVO> getReviewList(@Param("hospitalId") Long hospitalId);

}
