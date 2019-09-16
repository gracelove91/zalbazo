package kr.zalbazo.service.hospital;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.hospital.HospitalQnaMapper;
import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.hospital.HospitalQna;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HospitalQnaServiceImpl implements HospitalQnaService {
	
	@Setter(onMethod_= @Autowired)
	private HospitalQnaMapper qnaMapper;
	
	@Override
	public int registerContent(Content content) {
		return qnaMapper.insertContent(content);
	}

	@Override
	public int registerQna(HospitalQna hospitalQna) {
		return qnaMapper.insertQna(hospitalQna);
	}

	@Override
	public int removeQna(Long contentId) {
		return qnaMapper.deleteQna(contentId);
	}

	@Override
	public int removeContent(Long contentId) {
		return qnaMapper.deleteContent(contentId);
	}

	@Override
	public List<Content> getList(Long hospitalId) {
		return qnaMapper.getList(hospitalId);
	}

}
