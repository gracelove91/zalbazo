package kr.zalbazo.service.content;

import java.util.List;

import kr.zalbazo.model.content.FaqVO;

public interface FaqService {

	List<FaqVO> getFaqList(FaqVO faq);
	List<FaqVO> getFaqListAll();

}
