package kr.zalbazo.service;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.Criteria;

import java.util.List;

public interface ContentService {
	
    void register(Content content);
    Content get(Long contentId);
    boolean modify(Content content);
    boolean remove(Long contentId);
    //List<Content> getList(Long categoryId);
    List<Content> getList(Criteria cri);
	int getTotal(Criteria cri);
}
