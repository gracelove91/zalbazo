package kr.zalbazo.mapper.user.mypage;

import java.util.List;

import kr.zalbazo.model.favorite_hospital.FavoriteHospital;
import kr.zalbazo.model.hospital.Hospital;

public interface FavoriteHospitalMapper {


//    void insert(FavoriteHospital favoriteHospital);

    List<Hospital> getList(FavoriteHospital favoriteHospital);

    int delete(Long hospitalId);  

}

