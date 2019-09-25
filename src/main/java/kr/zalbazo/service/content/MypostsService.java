package kr.zalbazo.service.content;

import java.util.List;

import kr.zalbazo.model.content.Content;

public interface MypostsService {

	List<Content> getJisikdongList(Long categoryId);
}
