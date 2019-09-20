package kr.zalbazo.service.user.mypage;

import java.util.List;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.Criteria;

public interface MypostsService {

	List<Content> getList(Long categoryId);
}
