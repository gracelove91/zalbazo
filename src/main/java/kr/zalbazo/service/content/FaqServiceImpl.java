package kr.zalbazo.service.content;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.content.FaqMapper;
import kr.zalbazo.model.content.FaqVO;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqMapper mapper;

	@Override
	public List<FaqVO> getFaqList(Long faqId) {

		return mapper.getFaqList(faqId);

	}

	@Override
	public List<FaqVO> getFaqList2(FaqVO faq) {

		return mapper.getFaqList2(faq);
	}
}
