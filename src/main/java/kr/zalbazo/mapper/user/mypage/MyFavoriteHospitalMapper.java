package kr.zalbazo.mapper.user.mypage;

import java.util.List;

import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.Label;

public interface MyFavoriteHospitalMapper {

	List<Hospital> getList(String userEmail);

	List<Label> getLabelList(Long hospitalId);
	
	int removeMyFavorite(Long hospitalId);

}
