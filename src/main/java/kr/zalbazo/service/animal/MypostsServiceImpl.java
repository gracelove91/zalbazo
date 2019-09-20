package kr.zalbazo.service.user.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.user.mypage.MypostsMapper;
import kr.zalbazo.model.content.Content;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MypostsServiceImpl implements MypostsService{
	
	@Autowired
	private MypostsMapper mapper;
	
	public List<Content> getList(Long categoryId){
		
		return mapper.getList(categoryId);
	}
}
