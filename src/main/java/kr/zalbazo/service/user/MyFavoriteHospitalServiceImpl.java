package kr.zalbazo.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.user.mypage.MyFavoriteHospitalMapper;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalLabel;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MyFavoriteHospitalServiceImpl implements MyFavoriteHospitalService{

	@Setter(onMethod_ = @Autowired)
	private MyFavoriteHospitalMapper myFavoriteHospitalMapper;

	@Override
	public List<Hospital> getList(String userEmail) {
		return myFavoriteHospitalMapper.getList(userEmail);
	}

	@Override
	public List<HospitalLabel> getLabelList (Long hospitalId) {
		return myFavoriteHospitalMapper.getLabelList(hospitalId);
	}

	@Override
	public int removeMyFavorite(Long hospitalId) {
		// TODO Auto-generated method stub
		return myFavoriteHospitalMapper.removeMyFavorite(hospitalId);
	}


}
