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
	private HospitalJoinMapper mapper;

	@Transactional
	@Override
	public void insert(Hospital hospital) {
		
		mapper.infoInsert(hospital);
		
		if(hospital.getAttachList() == null || hospital.getAttachList().size() <= 0) {
			return;
		}
		
		hospital.getAttachList().forEach(attach ->{
			attach.setHospitalId(hospital.getHospitalId());
			mapper.picInsert(attach);
		});
	}


	@Override
	public Hospital get(String userEmail) {
		
		// userEmail(병원유저)에 해당하는 라벨과 병원 사진들의 리스트를 각각의 List에 담는다 
		List<Label> list = mapper.getLabel(userEmail);
		List<AttachFileDTO> picList = mapper.getPic(userEmail);
		
		// userEmail(병원유저)에 해당하는 병원의 정보를 HospitalInfo객체에 담는다
		Hospital hospital = mapper.get(userEmail);
		
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
		mapper.removePicFirst(hospital.getUserEmail());
		mapper.removePicLast();
		mapper.removeLabel(hospital.getUserEmail());
		
		mapper.update(hospital);
		
		if(hospital.getAttachList() == null || hospital.getAttachList().size() <= 0) {
			return;
		}
		
		hospital.getAttachList().forEach(attach ->{
			attach.setHospitalId(hospital.getHospitalId());
			mapper.picInsert(attach);
		});
		
	}


	@Override
	public void infoInsert(Hospital hospital) {
		mapper.infoInsert(hospital);
		
	}

	@Override
	public void labelInsert(Label label) {
		mapper.labelInsert(label);
	}

	@Override
	public void picInsert(AttachFileDTO attachFile) {
		mapper.picInsert(attachFile);
	}

	@Override
	public int update(Hospital hospital) {
		return mapper.update(hospital);
	}

	@Override
	public List<Label> getLabel(String userEmail) {
		return mapper.getLabel(userEmail);
	}

	@Override
	public List<AttachFileDTO> getPic(String userEmail) {
		return mapper.getPic(userEmail);
	}

	@Override
	public void removePicFirst(String userEmail) {
		mapper.removePicFirst(userEmail);
	}

	@Override
	public void removePicLast() {
		mapper.removePicLast();
	}

	@Override
	public void removeLabel(String userEmail) {
		mapper.removeLabel(userEmail);
	}

}
