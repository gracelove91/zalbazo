package kr.zalbazo.service.user;

import java.util.List;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.ReplyVO;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalQnaVO;
import kr.zalbazo.model.hospital.HospitalReviewVO;

public interface MyContentService {
	
	public List<Content> getCommunityList(String userEmail);
	
	public List<Content> getJisikdongList(String userEmail);
	
	public List<HospitalReviewVO> getReviewList(String userEmail);

	public List<HospitalQnaVO> getQList(String userEmail);
	
	public List<ReplyVO> getReplyList(String userEmail);
	
	public Hospital getName(Long hospitalId);

}
