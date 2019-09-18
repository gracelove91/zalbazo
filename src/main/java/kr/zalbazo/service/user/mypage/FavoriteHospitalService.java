package kr.zalbazo.service.user.mypage;

import java.util.List;

import kr.zalbazo.model.favorite_hospital.FavoriteHospital;
import kr.zalbazo.model.hospital.Hospital;


public interface FavoriteHospitalService {
	
//    void register(Animal animal);
    boolean remove(Long hospitalId);
    List<Hospital> getList(FavoriteHospital favoriteHospital);
}
