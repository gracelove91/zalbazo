package kr.zalbazo.service.user;

import kr.zalbazo.model.user.User;
import org.springframework.validation.BindingResult;

import java.util.List;

public interface AdminService {
	
	public List<User> getUserList();
	
	public List<User> getHosList();
	
	public Integer deleteUser(String userEmail);

	public Integer deleteHos(String userEmail);
	
	public User getUser(String userEmail);
	
	public User getHos(String userEmail);
	
}
