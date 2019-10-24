package kr.zalbazo.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.user.mypage.MessageMapper;
import kr.zalbazo.model.user.MessageVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MessageServiceImpl implements MessageService {
	
	@Setter(onMethod_= @Autowired)
	private MessageMapper mapper;

	@Override
	public int send(MessageVO vo) {
		return mapper.send(vo);
	}

	@Override
	public int reply(MessageVO vo) {
		return mapper.reply(vo);
	}

	@Override
	public int delete(Long contentId) {
		
		int i = 0;
		
		i += mapper.delete(contentId);
		
		MessageVO vo = mapper.get(contentId);
		
		if(vo != null) {
			i += mapper.delete(vo.getContentId());
		}
		
		return i;
	}

	@Override
	public MessageVO getInfo(Long contentId) {
		return mapper.get(contentId);
	}

	@Override
	public List<MessageVO> getAdminList() {
		return mapper.adminList();
	}

	@Override
	public List<MessageVO> getUserList(String userEmail) {
		return mapper.userList(userEmail);
	}

}
