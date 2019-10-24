package kr.zalbazo.service.content;

import java.util.List;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.Criteria;
import kr.zalbazo.model.pic.AttachFileDTO;
import kr.zalbazo.model.user.User;

public interface ContentService {
	
    void register(Content content);
    Content get(Long contentId);
    boolean modify(Content content);
    boolean remove(Long contentId);
    List<Content> getList(Criteria cri);
	int getTotal(Criteria cri);
	public List<AttachFileDTO> getAttachList(Long contentId);
    User getUser(String userEmail);
	
}
