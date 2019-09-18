package kr.zalbazo.service.user.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.user.mypage.FavoriteHospitalMapper;
import kr.zalbazo.model.favorite_hospital.FavoriteHospital;
import kr.zalbazo.model.hospital.Hospital;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class FavoriteHospitalServiceImpl implements FavoriteHospitalService {

    @Autowired
    private FavoriteHospitalMapper mapper;

//    @Override
//    public void register(FavoriteHospital fh) {
//        mapper.insert(fh);
//    }

   
    @Override
    public boolean remove(Long hospitalId) {
        return mapper.delete(hospitalId) == 1;
    }

	@Override
	public List<Hospital> getList(FavoriteHospital favoriteHospital) {
		return mapper.getList(favoriteHospital);
	}
    


   
}
