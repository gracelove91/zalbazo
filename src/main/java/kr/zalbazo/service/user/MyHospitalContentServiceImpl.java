package kr.zalbazo.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.user.MyHospitalContentMapper;
import kr.zalbazo.model.hospital.HospitalQnaVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MyHospitalContentServiceImpl implements MyHospitalContentService {

	@Setter(onMethod_ = @Autowired)
	private MyHospitalContentMapper myHospitalContentMapper;
	
	@Override
	public List<HospitalQnaVO> getHospitalQList(String userEmail) {
		return myHospitalContentMapper.getHospitalQList(userEmail);
	}

	@Override
	public int insertAnswer(HospitalQnaVO hospitalQnaVO) {
		return myHospitalContentMapper.insertAnswer(hospitalQnaVO);
	}

}
