package kr.zalbazo.service.hospital;

import java.util.List;

import kr.zalbazo.model.favorite_hospital.FavoriteHospital;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalLabel;


public interface FavoriteHospitalService {
	
    int register(FavoriteHospital favoriteHospital);
    
    int remove(Long hospitalId);
    
    List<Hospital> getList(FavoriteHospital favoriteHospital);
    
    List<HospitalLabel> getLabelList(Long hospitalId);

}