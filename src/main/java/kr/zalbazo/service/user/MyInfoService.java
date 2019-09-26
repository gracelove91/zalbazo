package kr.zalbazo.service.user;

import java.util.List;

import kr.zalbazo.model.user.User;

public interface MyInfoService {
	
	public List<User> getInfoList(String userEmail);

}
