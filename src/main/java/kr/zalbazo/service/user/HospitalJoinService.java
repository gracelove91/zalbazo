package kr.zalbazo.service.user;

import java.util.List;

import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.Label;
import kr.zalbazo.model.pic.AttachFileDTO;

public interface HospitalJoinService {
	
	void insert(Hospital hospital);
	
	Hospital get(String userEmail);
	
	void modify(Hospital hospital);
	
    void infoInsert(Hospital hospital);
    void labelInsert(Label label);
    void picInsert(AttachFileDTO attachFile);
    
    int update(Hospital hospital);
    
    List<Label> getLabel(String userEmail);
    List<AttachFileDTO> getPic(String userEmail);
    
    void removePicFirst(String userEmail);
    void removePicLast();
    void removeLabel(String userEmail);

}
