package kr.zalbazo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.content.ContentMapper;
import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.Criteria;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ContentServiceImpl implements ContentService {

    @Autowired
    private ContentMapper mapper;

    @Override
    public void register(Content content) {
        mapper.insert(content);
    }

    @Override
    public Content get(Long id) {
        return mapper.read(id);
    }

    @Override
    public boolean modify(Content content) {
        return mapper.update(content) == 1;
    }

    @Override
    public boolean remove(Long id) {
        return mapper.delete(id) == 1;
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
