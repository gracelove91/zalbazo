package kr.zalbazo.mapper.user.mypage;

import java.util.List;

import kr.zalbazo.model.user.User;

public interface MyInfoMapper {

	// 유저 인포 List
	public List<User> getInfoList(String userEmail);
}
