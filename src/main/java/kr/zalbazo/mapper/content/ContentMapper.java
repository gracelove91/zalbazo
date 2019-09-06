package kr.zalbazo.mapper.content;

import kr.zalbazo.model.content.Content;

import java.util.List;

public interface ContentMapper {
	
	List<Content> getList(Long CategoryId);
	
    void insert(Content content);
    
    Content read(Long contentId);
    
    int delete(Long contentId);
    
    int update(Content content);
    
}
