package kr.zalbazo.mapper.user;

import java.util.List;

import kr.zalbazo.model.user.User;

public interface AdminMapper {
	// Admin(관리자)페이지에서 필요한 모든 mapper는 여기에 넣기
	
	public List<User> getUserList();
	
	public List<User> getHosList();
	
	public Integer delete(String userEmail);
	
	public User get(String userEmail);

}
