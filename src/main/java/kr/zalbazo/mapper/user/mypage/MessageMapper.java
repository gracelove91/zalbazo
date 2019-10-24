package kr.zalbazo.mapper.user.mypage;

import java.util.List;

import kr.zalbazo.model.user.MessageVO;

public interface MessageMapper {
	
	public int send(MessageVO vo);
	public int reply(MessageVO vo);
	public int delete(Long contentId);
	public MessageVO get(Long contentId);
	public List<MessageVO> adminList();
	public List<MessageVO> userList(String userEmail);

}
