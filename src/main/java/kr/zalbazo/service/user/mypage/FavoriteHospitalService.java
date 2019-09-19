package kr.zalbazo.service.user.mypage;

import java.util.List;

import kr.zalbazo.model.favorite_hospital.FavoriteHospital;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalLabel;


public interface FavoriteHospitalService {
	
    void register(FavoriteHospital favoriteHospital);
    
    boolean remove(Long hospitalId);
    
    List<Hospital> getList(FavoriteHospital favoriteHospital);
    
    List<HospitalLabel> getLabelList(Long hospitalId);

}
