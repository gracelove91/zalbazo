package kr.zalbazo.mapper.content;

import java.util.List;

import kr.zalbazo.model.content.ContentAttachVO;

public interface ContentAttachMapper {
	
	public void insert(ContentAttachVO vo);
	
	public void delete(String uuid);
	
	public List<ContentAttachVO> findByContentId(Long contentId);

}
