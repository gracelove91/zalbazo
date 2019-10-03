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
		
		// userEmail(병원유저)에 해당하는 라벨과 병원 사진들의 리스트를 각각의 List에 담는다 
		List<Label> list = hospitalJoinMapper.getLabel(userEmail);
		List<AttachFileDTO> picList = hospitalJoinMapper.getPic(userEmail);
		
		// userEmail(병원유저)에 해당하는 병원의 정보를 HospitalInfo객체에 담는다
		HospitalInfo info = hospitalJoinMapper.get(userEmail);
		
		// set메서드를 사용하여 HospitalInfo에 라벨들과 사진들을 넣는다
		info.setLabel(list);
		info.setAttachList(picList);
		
		log.info(info);
		
		return info;
	}


}
