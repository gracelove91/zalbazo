package kr.zalbazo.mapper.user.mypage;

import java.util.List;

import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalLabel;
import oracle.net.aso.i;

public interface MyFavoriteHospitalMapper {

	List<Hospital> getList(String userEmail);

	List<HospitalLabel> getLabelList(Long hospitalId);
	
	int removeMyFavorite(Long hospitalId);

}
