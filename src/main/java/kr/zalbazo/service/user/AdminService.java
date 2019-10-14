package kr.zalbazo.service.user;

import kr.zalbazo.model.user.User;
import org.springframework.validation.BindingResult;

import java.util.List;

public interface AdminService {
	
	public List<User> getUserList();
	
	public List<User> getHosList();
	
	public Integer delete(String userEmail);
	
	public User get(String userEmail);
	
}
