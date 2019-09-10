package kr.zalbazo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.zalbazo.mapper.content.ContentAttachMapper;
import kr.zalbazo.mapper.content.ContentMapper;
import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.Criteria;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ContentServiceImpl implements ContentService {

    @Autowired
    private ContentMapper mapper;
    
    @Autowired
    private ContentAttachMapper attachMapper;

    @Transactional
    @Override
    public void register(Content content) {
    	
    	log.info("register : "+content);
    	
        mapper.insert(content);
        
        if(content.getAttachList() == null || content.getAttachList().size() <=0 ) {
        	return;
        }
        
        content.getAttachList().forEach(attach -> {
        	attach.setContentId(content.getContentId());
        	attachMapper.insert(attach);
        });
    }

    @Override
    public Content get(Long contentId) {
        return mapper.read(contentId);
    }

    @Override
    public boolean modify(Content content) {
        return mapper.update(content) == 1;
    }

    @Override
    public boolean remove(Long contentId) {
        return mapper.delete(contentId) == 1;
    }

//    @Override
//    public List<Content> getList(Long categoryId) {
//        return mapper.getList(categoryId);
//    }
    
    @Override
    public List<Content> getList(Criteria cri){
    	log.info("get List with criteria : " + cri);
    	return mapper.getListWithPaging(cri);
    }

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
    
   
}
