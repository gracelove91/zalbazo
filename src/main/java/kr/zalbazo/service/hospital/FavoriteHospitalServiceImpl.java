package kr.zalbazo.service.hospital;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.user.mypage.FavoriteHospitalMapper;
import kr.zalbazo.model.favorite_hospital.FavoriteHospital;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.Label;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class FavoriteHospitalServiceImpl implements FavoriteHospitalService {

    @Autowired
    private FavoriteHospitalMapper mapper;

    @Override
    public int register(FavoriteHospital favoriteHospital) {
		return mapper.insertFavorite(favoriteHospital);
    }

   
    @Override
    public int remove(Long hospitalId) {
        return mapper.remove(hospitalId);
    }

	@Override
	public List<Hospital> getList(FavoriteHospital favoriteHospital) {
		return mapper.getList(favoriteHospital);
	}

	@Override
	public List<Label> getLabelList(Long hospitalId) {
		// TODO Auto-generated method stub
		return mapper.getLabelList(hospitalId);
	}


    

   
}
