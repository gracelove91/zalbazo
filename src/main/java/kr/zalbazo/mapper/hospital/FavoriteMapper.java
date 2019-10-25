package kr.zalbazo.mapper.hospital;

import java.util.List;

import kr.zalbazo.model.hospital.Hospital;

public interface FavoriteMapper {

    List<Hospital> getFavoriteList(String userEmail);

	int removeFavorite(Long fhospitalId);

	int insertFavorite(Hospital hospital);
	
	int toEmptyHeart(Long hospitalId, String userEmail); 
	
}

