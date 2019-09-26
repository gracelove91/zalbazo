package kr.zalbazo.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.user.mypage.MyInfoMapper;
import kr.zalbazo.model.user.User;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MyInfoServiceImpl implements MyInfoService{

	@Setter(onMethod_ = @Autowired)
	private MyInfoMapper myInfoMapper;
	
	@Override
	public List<User> getInfoList(String userEmail) {
		return myInfoMapper.getInfoList(userEmail);
	}

}
