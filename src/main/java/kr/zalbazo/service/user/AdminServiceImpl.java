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
	public Integer delete(String userEmail) {
		return adminMapper.delete(userEmail);
	}

	@Override
	public User get(String userEmail) {
		adminMapper.delete(userEmail);
		return adminMapper.get(userEmail);
	}

    
}