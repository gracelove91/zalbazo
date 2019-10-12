package kr.zalbazo.service.hospital;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.hospital.FavoriteMapper;
import kr.zalbazo.model.hospital.Hospital;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FavoriteServiceImpl implements FavoriteService {
	
	@Setter(onMethod_= @Autowired)
	private FavoriteMapper mapper;

	@Override
	public List<Hospital> getFavoriteList(String userEmail) {
		return mapper.getFavoriteList(userEmail);
	}

	@Override
	public int removeFavorite(Long fhospitalId) {
		return mapper.removeFavorite(fhospitalId);
	}

	@Override
	public int toFullHeart(Hospital hospital) {
		return mapper.insertFavorite(hospital);
	}

	@Override
	public int toEmptyHeart(Long hospitalId, String userEmail) {
		return mapper.toEmptyHeart(hospitalId, userEmail);
	}

}
