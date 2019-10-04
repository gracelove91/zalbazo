package kr.zalbazo.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.zalbazo.mapper.user.HospitalJoinMapper;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.Label;
import kr.zalbazo.model.pic.AttachFileDTO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HospitalJoinServiceImpl implements HospitalJoinService {
	
	@Setter(onMethod_ = @Autowired)
	private HospitalJoinMapper hospitalJoinMapper;

	@Transactional
	@Override
	public void hospitalInfoRegister(Hospital hospital) {
		hospitalJoinMapper.hospitalInfoInsert(hospital);
		
		if(hospital.getAttachList() == null || hospital.getAttachList().size() <= 0) {
			return;
		}
		
		System.out.println("hospitalId : " + hospital.getHospitalId());
		hospital.getAttachList().forEach(attach ->{
			attach.setHospitalId(hospital.getHospitalId());
			hospitalJoinMapper.hospitalPicInsert(attach);
		});
	}

	@Override
	public void labelInsert(Label label) {
		hospitalJoinMapper.labelInsert(label);
	}

	@Override
	public void picInsert(AttachFileDTO attachFile) {
		hospitalJoinMapper.hospitalPicInsert(attachFile);
	}

	@Override
	public Hospital get(String userEmail) {
		
		// userEmail(병원유저)에 해당하는 라벨과 병원 사진들의 리스트를 각각의 List에 담는다 
		List<Label> list = hospitalJoinMapper.getLabel(userEmail);
		List<AttachFileDTO> picList = hospitalJoinMapper.getPic(userEmail);
		
		// userEmail(병원유저)에 해당하는 병원의 정보를 HospitalInfo객체에 담는다
		Hospital hospital = hospitalJoinMapper.get(userEmail);
		
		// set메서드를 사용하여 HospitalInfo에 라벨들과 사진들을 넣는다
		hospital.setLabel(list);
		hospital.setAttachList(picList);
		
		log.info(hospital);
		
		return hospital;
	}
	
	
	@Transactional
	@Override
	public void modify(Hospital hospital) {
		log.info("modify..........." + hospital.getUserEmail());
		
		// 어떤 사진이 다시 업데이트 되고 지워지는지 확인이 어렵기 때문에
		// 첨부파일을 그냥 싹 지우고 다시 업데이트 하는 식으로 처리 (+ 라벨도)
		hospitalJoinMapper.removePicFirst(hospital.getUserEmail());
		hospitalJoinMapper.removePicLast();
		hospitalJoinMapper.removeLabel(hospital.getUserEmail());
		
		hospitalJoinMapper.update(hospital);
		
		if(hospital.getAttachList() == null || hospital.getAttachList().size() <= 0) {
			return;
		}
		
		System.out.println("hospitalId : " + hospital.getHospitalId());
		
		hospital.getAttachList().forEach(attach ->{
			attach.setHospitalId(hospital.getHospitalId());
			hospitalJoinMapper.hospitalPicInsert(attach);
		});
		
	}

	@Override
	public List<AttachFileDTO> getPicList(String userEmail) {
		return hospitalJoinMapper.getPic(userEmail);
	}

	@Override
	public int update(Hospital hospital) {
		return hospitalJoinMapper.update(hospital);
	}


}
