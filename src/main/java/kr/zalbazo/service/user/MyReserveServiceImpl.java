package kr.zalbazo.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.user.mypage.MyReserveMapper;
import kr.zalbazo.model.hospital.HospitalReviewVO;
import kr.zalbazo.model.user.Reserve;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MyReserveServiceImpl implements MyReserveService{

	@Setter(onMethod_ = @Autowired)
	private MyReserveMapper myReserveMapper;
	
	@Override
	public List<Reserve> getReserveList(String userEmail) {
		return myReserveMapper.getReserveList(userEmail);
	}

	@Override
	public Reserve get(Long reserveId, String userEmail) {
		return myReserveMapper.get(reserveId, userEmail);
	}

	@Override
	public int insertReview(HospitalReviewVO hospitalReviewVO) {
		return myReserveMapper.insertReview(hospitalReviewVO);
	}

	@Override
	public int update(Reserve reserve) {
		return myReserveMapper.update(reserve);
	}



}
