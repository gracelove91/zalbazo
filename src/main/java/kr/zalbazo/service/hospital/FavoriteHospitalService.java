package kr.zalbazo.service.hospital;

import java.util.List;

import kr.zalbazo.model.favorite_hospital.FavoriteHospital;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.Label;


public interface FavoriteHospitalService {
	
    int register(FavoriteHospital favoriteHospital);
    
    int remove(Long hospitalId);
    
    List<Hospital> getList(FavoriteHospital favoriteHospital);
    
    List<Label> getLabelList(Long hospitalId);

}
