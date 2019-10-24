package kr.zalbazo.service.hospital;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.zalbazo.mapper.hospital.HospitalMapper;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.Label;
import kr.zalbazo.model.pic.AttachFileDTO;
import kr.zalbazo.model.user.User;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class HospitalServiceImpl implements HospitalService{
	
	@Autowired
	HospitalMapper mapper;

    @Transactional
	@Override
	public Hospital get(Long hospitalId) {
		
		List<Label> labelList = mapper.labelList(hospitalId);
		List<AttachFileDTO> picList = mapper.pictureList(hospitalId);
		
		Hospital hospital = mapper.get(hospitalId);
		hospital.setLabel(labelList);
		hospital.setAttachList(picList);
		
		return hospital;
	}

    
    @Transactional
	@Override
	public List<Hospital> getList() {
		
		List<Hospital> list = mapper.getList();
		
		list.forEach(hospital->{
			List<Label> labelList = mapper.labelList(hospital.getHospitalId());
			List<AttachFileDTO> pic = mapper.picOne(hospital.getHospitalId());
			hospital.setLabel(labelList);
			hospital.setAttachList(pic);
		});
		
		return list; 
	}


}
