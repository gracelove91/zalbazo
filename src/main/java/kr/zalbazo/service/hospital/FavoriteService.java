package kr.zalbazo.service.hospital;

import java.util.List;

import kr.zalbazo.model.hospital.Hospital;

public interface FavoriteService {
	
    List<Hospital> getFavoriteList(String userEmail);

	int removeFavorite(Long fhospitalId);

	int toFullHeart(Hospital hospital);
	
	int toEmptyHeart(Long hospitalId, String userEmail); 

}
