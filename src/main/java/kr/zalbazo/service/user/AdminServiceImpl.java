package kr.zalbazo.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.user.AdminMapper;
import kr.zalbazo.model.user.User;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {
	
	@Setter(onMethod_ = @Autowired)
	private AdminMapper adminMapper;
	
	@Override
	public List<User> getUserList() {
		return adminMapper.getUserList();
	}

	@Override
	public List<User> getHosList() {
		return adminMapper.getHosList();
	}

	@Override
	public Integer deleteUser(String userEmail) {
		return adminMapper.deleteUser(userEmail);
	}

	@Override
	public Integer deleteHos(String userEmail) {
		return adminMapper.deleteHos(userEmail);
	}

	@Override
	public User getUser(String userEmail) {
		adminMapper.deleteUser(userEmail);
		return adminMapper.getUser(userEmail);
	}

	@Override
	public User getHos(String userEmail) {
		adminMapper.deleteHos(userEmail);
		return adminMapper.getHos(userEmail);
	}

	@Override
	public User getsearchUser(String userEmail) {

		return adminMapper.getUser(userEmail);
	}
	@Override
	public User getsearchHos(String userEmail) {
		
		return adminMapper.getHos(userEmail);
	}

    
}