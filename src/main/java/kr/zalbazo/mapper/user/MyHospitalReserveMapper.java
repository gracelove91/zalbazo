package kr.zalbazo.mapper.user;

import java.util.List;

import kr.zalbazo.model.user.Reserve;

public interface MyHospitalReserveMapper {
	
	// 예약 List
	public List<Reserve> getHospitalReserveList(String userEmail);
	
	// 예약 수
	public List<Reserve> getHospitalReserveCount(String userEmail);
	
	public Reserve get(Long reserveId);

	public int update(Reserve reserveId);
	
	public int delete(Long reserveId);
}
