package kr.zalbazo.mapper.user.mypage;

import java.util.List;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.ReplyVO;
import kr.zalbazo.model.hospital.HospitalQnaVO;
import kr.zalbazo.model.hospital.HospitalReviewVO;

public interface MyContentMapper {
	
	// 커뮤니티(1) List
	public List<Content> getCommunityList(String userEmail);
	
	// 지식동(2) List
	public List<Content> getJisikdongList(String userEmail);
	
	// 리뷰(3) List
	public List<HospitalReviewVO> getReviewList(String userEmail);
	
	// Q(4) List
	public List<HospitalQnaVO> getQList(String userEmail);
	
	// A(4) List
	public List<HospitalQnaVO> getAList(Long contentId);
	
	// 댓글 List
	public List<ReplyVO> getReplyList(String userEmail);

}
