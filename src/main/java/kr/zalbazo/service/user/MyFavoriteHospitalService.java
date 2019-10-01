package kr.zalbazo.service.user;

import java.util.List;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.ReplyVO;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalLabel;
import kr.zalbazo.model.hospital.HospitalQnaVO;
import kr.zalbazo.model.hospital.HospitalReviewVO;

public interface MyFavoriteHospitalService {
    
    List<Hospital> getList(String userEmail);
    
    List<HospitalLabel> getLabelList(Long hospitalId);

	int removeMyFavorite(Long hospitalId);
}
