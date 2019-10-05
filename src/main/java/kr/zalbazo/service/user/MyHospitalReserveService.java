package kr.zalbazo.service.user;

import java.util.List;

import kr.zalbazo.model.user.Reserve;

public interface MyHospitalReserveService {
	
	public List<Reserve> getHospitalReserveList(String userEmail);
	
	public Reserve get(Long reserveId);
	
	public int update(Reserve reserve);

}
