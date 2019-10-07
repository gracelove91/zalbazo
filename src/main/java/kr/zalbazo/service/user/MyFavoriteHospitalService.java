package kr.zalbazo.service.user;

import java.util.List;

import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.Label;

public interface MyFavoriteHospitalService {
    
    List<Hospital> getList(String userEmail);
    
    List<Label> getLabelList(Long hospitalId);

	int removeMyFavorite(Long hospitalId);
}
