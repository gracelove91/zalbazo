package kr.zalbazo.service;

import java.util.List;

import kr.zalbazo.model.content.Criteria;
import kr.zalbazo.model.content.ReplyPageDTO;
import kr.zalbazo.model.content.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);
	
	public ReplyVO get(Long replyid);
	
	public int modify(ReplyVO vo);
	
	public int remove(Long replyid);
	
	public List<ReplyVO> getList(Criteria cri, Long contentId);
	
	public ReplyPageDTO getListPage(Criteria cri, Long contentId);

}
