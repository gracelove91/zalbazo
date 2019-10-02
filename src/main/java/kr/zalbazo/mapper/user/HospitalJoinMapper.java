package kr.zalbazo.mapper.user;

import java.util.List;

import kr.zalbazo.model.content.Label;
import kr.zalbazo.model.hospital.HospitalLabel;
import kr.zalbazo.model.pic.AttachFileDTO;
import kr.zalbazo.model.user.HospitalInfo;

public interface HospitalJoinMapper {
	
    void hospitalInfoInsert(HospitalInfo hospitalInfo);
    void labelInsert(HospitalLabel hospitalLabel);
    void hospitalPicInsert(AttachFileDTO attachFile);
    
    HospitalInfo get(String userEmail);
    List<Label> getLabel(String userEmail);

}