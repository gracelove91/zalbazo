package kr.zalbazo.mapper.user;

import java.util.List;

import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.Label;
import kr.zalbazo.model.pic.AttachFileDTO;

public interface HospitalJoinMapper {
	
    void infoInsert(Hospital hospital);
    void labelInsert(Label label);
    void picInsert(AttachFileDTO attachFile);
    
    int update(Hospital hospital);
    
    Hospital get(String userEmail);
    List<Label> getLabel(String userEmail);
    List<AttachFileDTO> getPic(String userEmail);
    
    void removePicFirst(String userEmail);
    void removePicLast();
    void removeLabel(String userEmail);

}