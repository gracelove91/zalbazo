package kr.zalbazo.mapper.user;

import java.util.List;

import kr.zalbazo.model.user.Reserve;

public interface MyHospitalReserveMapper {
	
	public List<Reserve> getHospitalReserveList(String userEmail);
	
	public Reserve get(Long reserveId);

	public int update(Reserve reserveId);
}
