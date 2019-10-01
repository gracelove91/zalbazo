package kr.zalbazo.mapper.user.mypage;

import java.util.List;

import kr.zalbazo.model.favorite_hospital.FavoriteHospital;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalLabel;

public interface MyFavoriteHospitalMapper {

	List<Hospital> getList(String userEmail);

	List<HospitalLabel> getLabelList(Long hospitalId);

}
