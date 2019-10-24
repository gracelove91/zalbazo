package kr.zalbazo.service.content;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.content.ReplyMapper;
import kr.zalbazo.model.content.Criteria;
import kr.zalbazo.model.content.ReplyPageDTO;
import kr.zalbazo.model.content.ReplyVO;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper mapper;

	@Override
	public int register(ReplyVO vo) {
		log.info("register");
		
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long replyid) {
		log.info("get");
		
		return mapper.read(replyid);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify");
		
		return mapper.update(vo);
	}

	@Override
	public int remove(Long replyid) {
		log.info("remove");
		
		return mapper.delete(replyid);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long contentId) {
		log.info("list");
		
		return mapper.getListWithPaging(cri, contentId);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long contentId) {
		return new ReplyPageDTO(
				mapper.getCountByContentId(contentId),
				mapper.getListWithPaging(cri, contentId));
	}

}
