package kr.zalbazo.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.zalbazo.mapper.user.HospitalJoinMapper;
import kr.zalbazo.model.content.Label;
import kr.zalbazo.model.hospital.HospitalLabel;
import kr.zalbazo.model.pic.AttachFileDTO;
import kr.zalbazo.model.user.HospitalInfo;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HospitalJoinServiceImpl implements HospitalJoinService {
	
	@Setter(onMethod_ = @Autowired)
	private HospitalJoinMapper hospitalJoinMapper;

	@Transactional
	@Override
	public void hospitalInfoRegister(HospitalInfo hospitalInfo) {
		hospitalJoinMapper.hospitalInfoInsert(hospitalInfo);
		
		if(hospitalInfo.getAttachList() == null || hospitalInfo.getAttachList().size() <= 0) {
			return;
		}
		
		System.out.println("hospitalId : " + hospitalInfo.getHospitalId());
		hospitalInfo.getAttachList().forEach(attach ->{
			attach.setHospitalId(hospitalInfo.getHospitalId());
			hospitalJoinMapper.hospitalPicInsert(attach);
		});
	}

	@Override
	public void labelInsert(HospitalLabel hospitalLabel) {
		hospitalJoinMapper.labelInsert(hospitalLabel);
	}

	@Override
	public void picInsert(AttachFileDTO attachFile) {
		hospitalJoinMapper.hospitalPicInsert(attachFile);
	}

	@Override
	public HospitalInfo get(String userEmail) {
		List<Label> list = hospitalJoinMapper.getLabel(userEmail);
		
		HospitalInfo info = hospitalJoinMapper.get(userEmail);
		info.setLabel(list);
		
		log.info(info);
		
		return info;
	}


}
