package kr.zalbazo.service.user;

import java.util.List;

import kr.zalbazo.model.user.MessageVO;

public interface MessageService {
	
	public int send(MessageVO vo);
	public int reply(MessageVO vo);
	public int delete(Long contentId);
	public MessageVO getInfo(Long contentId);
	public List<MessageVO> getAdminList();
	public List<MessageVO> getUserList(String userEmail);

}
