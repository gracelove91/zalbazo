package kr.zalbazo.mapper.user.mypage;

import java.util.List;

import kr.zalbazo.model.hospital.HospitalReviewVO;
import kr.zalbazo.model.user.Reserve;

public interface MyReserveMapper {
	
	public List<Reserve> getReserveList(String userEmail);
	
	public Reserve get(Long reserveId, String userEmail);
	
	// 병원리뷰 쓰기
	public int insertReview(HospitalReviewVO hospitalReviewVO);
	
	// 리뷰 작성 시, 상태 변경
	public int update(Reserve reserveId);
}
