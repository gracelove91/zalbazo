package kr.zalbazo.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.user.HospitalJoinMapper;
import kr.zalbazo.model.hospital.HospitalLabel;
import kr.zalbazo.model.user.HospitalInfo;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HospitalJoinServiceImpl implements HospitalJoinService {
	
	@Setter(onMethod_ = @Autowired)
	private HospitalJoinMapper hospitalJoinMapper;

	@Override
	public void hospitalInfoRegister(HospitalInfo hospitalInfo) {
		hospitalJoinMapper.hospitalInfoInsert(hospitalInfo);
	}

	@Override
	public void labelInsert(HospitalLabel hospitalLabel) {
		hospitalJoinMapper.labelInsert(hospitalLabel);
	}

}
