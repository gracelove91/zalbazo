package kr.zalbazo.mapper.hospital;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.hospital.HospitalQnaVO;
import kr.zalbazo.model.hospital.HospitalReviewVO;

public interface HospitalReviewMapper {
	
	// 병원별 리뷰 리스트
	public List<HospitalReviewVO> getReviewList(@Param("hospitalId") Long hospitalId);
	
	// 병원별 리뷰 평점 평균
	public double get(@Param("hospitalId") Long hospitalId);
	
	// 병원별 리뷰 평점 개수
	public int getTotal(@Param("hospitalId") Long hospitalId);

}
