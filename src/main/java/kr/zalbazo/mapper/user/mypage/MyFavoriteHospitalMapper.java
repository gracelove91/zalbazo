package kr.zalbazo.mapper.user.mypage;

import java.util.List;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.ReplyVO;
import kr.zalbazo.model.favorite_hospital.FavoriteHospital;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalLabel;
import kr.zalbazo.model.hospital.HospitalQnaVO;
import kr.zalbazo.model.hospital.HospitalReviewVO;

public interface MyFavoriteHospitalMapper {

	int remove(Long hospitalId);

	List<Hospital> getList(String userEmail);

	List<HospitalLabel> getLabelList(Long hospitalId);

}
