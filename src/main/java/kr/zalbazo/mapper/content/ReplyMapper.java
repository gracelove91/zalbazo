package kr.zalbazo.mapper.content;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.zalbazo.model.content.Criteria;
import kr.zalbazo.model.content.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long replyid);

	public int delete(Long replyid);
	
	public int update(ReplyVO userEmail);
	
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("contentId") Long contentId);
	
	public int getCountByContentId(Long contentId);
}
