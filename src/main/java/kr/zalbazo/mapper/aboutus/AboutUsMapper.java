package kr.zalbazo.mapper.aboutus;

import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalReviewVO;
import kr.zalbazo.model.user.Reserve;
import kr.zalbazo.model.user.User;

public interface AboutUsMapper {
	
	// 누적 예약수
	public int reseveCount(Reserve reserve);
	
	// 누적 리뷰수
	public int reviewCount(HospitalReviewVO hopitalReviewVO);
	
	// 유저수
	public int userCount(User user);
	
	// 누적 병원찾기
	public int hospitalCount(Hospital hospital);
}
