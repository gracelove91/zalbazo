package kr.zalbazo.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.user.mypage.MyContentMapper;
import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.ReplyVO;
import kr.zalbazo.model.hospital.Hospital;
import kr.zalbazo.model.hospital.HospitalQnaVO;
import kr.zalbazo.model.hospital.HospitalReviewVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MyContentServiceImpl implements MyContentService{

	@Setter(onMethod_ = @Autowired)
	private MyContentMapper myContentMapper;
	
	@Override
	public List<Content> getCommunityList(String userEmail) {
		return myContentMapper.getCommunityList(userEmail);
	}

	@Override
	public List<Content> getJisikdongList(String userEmail) {
		return myContentMapper.getJisikdongList(userEmail);
	}

	@Override
	public List<HospitalReviewVO> getReviewList(String userEmail) {
		return myContentMapper.getReviewList(userEmail);
	}

	@Override
	public List<HospitalQnaVO> getQList(String userEmail) {
		return myContentMapper.getQList(userEmail);
	}

	@Override
	public List<ReplyVO> getReplyList(String userEmail) {
		return myContentMapper.getReplyList(userEmail);
	}

	@Override
	public Hospital getName(Long hospitalId) {
		return myContentMapper.getName(hospitalId);
	}

	@Override
	public int deleteQna(Long contentId) {
		return myContentMapper.deleteQna(contentId);
	}

	@Override
	public int deleteContent(Long contentId) {
		return myContentMapper.deleteContent(contentId);
	}

	@Override
	public HospitalQnaVO getANo(Long contentId) {
		return myContentMapper.getANo(contentId);
	}

}
