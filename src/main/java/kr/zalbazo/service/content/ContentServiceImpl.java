package kr.zalbazo.service.content;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.zalbazo.mapper.content.ContentAttachMapper;
import kr.zalbazo.mapper.content.ContentMapper;
import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.Criteria;
import kr.zalbazo.model.pic.AttachFileDTO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ContentServiceImpl implements ContentService {

    @Setter(onMethod_= @Autowired)
    private ContentMapper mapper;
    
    @Setter(onMethod_= @Autowired)
    private ContentAttachMapper attachMapper;
    

    @Transactional
    @Override
    public void register(Content content) {

    	log.info("register........"+content);
    	
    	mapper.insert(content);
    	
    	if(content.getAttachList() == null || content.getAttachList().size() <= 0) {
    		return;
    	}
    	System.out.println("contentId : " +content.getContentId());
    	content.getAttachList().forEach(attach ->{
    		attach.setContentId(content.getContentId());
    		attachMapper.insert(attach);
    	});
    }

    @Override
    public Content get(Long contentId) {
        return mapper.read(contentId);
    }

    
    @Transactional
    @Override
    public boolean modify(Content content) {
    	
    	log.info("modify.........." + content);
    	
    	//  findByNo 메서드를 통해 해당 글에 있는 첨부파일 객체들을 리스트에 담는다
    	List<AttachFileDTO> list = attachMapper.findByNo(content.getContentId());
    	
    	// 먼저 contentId에 따라 pic_lib_rel_content에 해당되는 것들을 다 지운다 
    	attachMapper.deletePicCon(content.getContentId());
    	
    	//  가져온 첨부파일 객체들에서 각각의 uuid를 뽑아서 pic_lib에 있는 것들을 지운다
    	list.forEach(attach ->{
    		System.out.println("abcabc : " +attach);
    		attachMapper.deletePic(attach.getUuid());
    	});
    	
    	// 글 수정
    	boolean modifyResult = mapper.update(content) == 1;
    	
    	if(modifyResult && content.getAttachList() != null && content.getAttachList().size() > 0) {
    		content.getAttachList().forEach(attach -> {
    			attach.setContentId(content.getContentId());
    			attachMapper.insert(attach);
    		});
    	}
    	
    	return modifyResult;
    }

    
    @Override
    public boolean remove(Long contentId) {
    	
    	//  findByNo 메서드를 통해 해당 글에 있는 첨부파일 객체들을 리스트에 담는다
    	List<AttachFileDTO> list = attachMapper.findByNo(contentId);
    	
    	// 먼저 contentId에 따라 pic_lib_rel_content에 해당되는 것들을 다 지운다 
    	attachMapper.deletePicCon(contentId);
    	
    	//  가져온 첨부파일 객체들에서 각각의 uuid를 뽑아서 pic_lib에 있는 것들을 지운다
    	list.forEach(attach ->{
    		System.out.println("abcabc : " +attach);
    		attachMapper.deletePic(attach.getUuid());
    	});
    	
    	// 최종적으로 해당 글을 삭제
        return mapper.delete(contentId) == 1;
    }

    @Override
    public List<Content> getList(Criteria cri) {
        log.info("get List with criteria : " + cri);
        return mapper.getListWithPaging(cri);
    }

    @Override
    public int getTotal(Criteria cri) {
        return mapper.getTotalCount(cri);
    }

	@Override
	public List<AttachFileDTO> getAttachList(Long contentId) {
		log.info("get Attach list by contentId  " + contentId);
		return attachMapper.findByNo(contentId);
	}

}
