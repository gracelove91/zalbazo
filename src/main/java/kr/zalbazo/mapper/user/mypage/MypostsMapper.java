package kr.zalbazo.mapper.user.mypage;

import java.util.List;

import kr.zalbazo.model.content.Content;

public interface MypostsMapper {

	public List<Content> getList(Long categoryId);
	
}
