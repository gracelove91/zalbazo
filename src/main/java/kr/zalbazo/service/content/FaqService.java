package kr.zalbazo.service.content;

import java.util.List;

import kr.zalbazo.model.content.FaqVO;

public interface FaqService {

	List<FaqVO> getFaqList(Long faqId);
	List<FaqVO> getFaqList2(FaqVO faq);
	List<FaqVO> getFaqListAll();

}
