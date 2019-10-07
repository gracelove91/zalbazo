package kr.zalbazo.mapper.user.mypage;

import java.util.List;

import kr.zalbazo.model.favorite_hospital.FavoriteHospital;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.Label;
import kr.zalbazo.model.user.User;

public interface FavoriteHospitalMapper {

    List<Hospital> getList(FavoriteHospital favoriteHospital);

	List<Label> getLabelList(Long hospitalId);
	
	int remove(Long hospitalId);

	int insertFavorite(FavoriteHospital favoriteHospital);
	
	User getUser(String userEmail);
}

