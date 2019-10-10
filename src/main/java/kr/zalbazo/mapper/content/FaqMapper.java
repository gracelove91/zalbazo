package kr.zalbazo.mapper.content;

import java.util.List;

import kr.zalbazo.model.content.FaqVO;

public interface FaqMapper {

	List<FaqVO> getFaqList(FaqVO faq);
	List<FaqVO> getFaqListAll();
}
