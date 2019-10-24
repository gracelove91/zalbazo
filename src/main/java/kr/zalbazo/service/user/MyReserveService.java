package kr.zalbazo.service.user;

import java.util.List;

import kr.zalbazo.model.hospital.HospitalReviewVO;
import kr.zalbazo.model.user.Reserve;

public interface MyReserveService {

	public List<Reserve> getReserveList(String userEmail);
	
	public Reserve get(Long reserveId, String userEmail);
	
	public int insertReview(HospitalReviewVO hospitalReviewVO);
	
	public int update(Reserve reserve);
}
