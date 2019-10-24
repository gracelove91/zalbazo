package kr.zalbazo.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.user.MyHospitalReserveMapper;
import kr.zalbazo.model.user.Reserve;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MyHospitalReserveServiceImpl implements MyHospitalReserveService{

	@Setter(onMethod_ = @Autowired)
	private MyHospitalReserveMapper myHospitalReserveMapper;
	
	@Override
	public List<Reserve> getHospitalReserveList(String userEmail) {
		return myHospitalReserveMapper.getHospitalReserveList(userEmail);
	}
	
	@Override
	public List<Reserve> getHospitalReserveCount(String userEmail) {
		return myHospitalReserveMapper.getHospitalReserveCount(userEmail);
	}

	@Override
	public Reserve get(Long reserveId) {
		return myHospitalReserveMapper.get(reserveId);
	}

	@Override
	public int update(Reserve reserve) {
		return myHospitalReserveMapper.update(reserve);
	}

	@Override
	public int delete(Long reserveId) {
		return myHospitalReserveMapper.delete(reserveId);
	}


}
