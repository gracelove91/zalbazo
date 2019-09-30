package kr.zalbazo.mapper.user;

import kr.zalbazo.model.hospital.HospitalLabel;
import kr.zalbazo.model.pic.AttachFileDTO;
import kr.zalbazo.model.user.HospitalInfo;

public interface HospitalJoinMapper {
	
    void hospitalInfoInsert(HospitalInfo hospitalInfo);
    void labelInsert(HospitalLabel hospitalLabel);
    void hospitalPicInsert(AttachFileDTO attachFile);

}