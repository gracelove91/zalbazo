package kr.zalbazo.service.hospital;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.zalbazo.mapper.hospital.HospitalQnaMapper;
import kr.zalbazo.model.hospital.HospitalQnaVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HospitalQnaServiceImpl implements HospitalQnaService {
	
	@Setter(onMethod_= @Autowired)
	private HospitalQnaMapper qnaMapper;

	@Override
	public int removeQna(Long contentId) {
		return qnaMapper.deleteQna(contentId);
	}

	@Override
	public int removeContent(Long contentId) {
		return qnaMapper.deleteContent(contentId);
	}
	
	
    @Transactional
	@Override
	public void remove(Long contentId) {
		
		// Q와 A를 동시에 지우기 
		
		qnaMapper.deleteQna(contentId);
		qnaMapper.deleteContent(contentId);
		
		// Q에 대한 A의 contentId값을 얻기 
		HospitalQnaVO vo = qnaMapper.getANo(contentId);
		Long ano = vo.getHospitalId();
		
		qnaMapper.deleteQna(ano);
		qnaMapper.deleteContent(ano);
		
	}

	@Override
	public List<HospitalQnaVO> getQnaList(Long hospitalId) {
		return qnaMapper.getQnaList(hospitalId);
	}

	@Override
	public HospitalQnaVO getANo(Long contentId) {
		return qnaMapper.getANo(contentId);
	}

	@Override
	public int insertQuestion(HospitalQnaVO hospitalQnaVO, Authentication auth) {
		
		int result = 0;
		
		if(!(auth.getAuthorities().toString().equals("[ROLE_user]"))) {
			result = -1;
		} else {
			result = qnaMapper.insertQuestion(hospitalQnaVO);
		}
		
		return result;
	}

	@Override
	public int insertAnswer(HospitalQnaVO hospitalQnaVO) {
		return qnaMapper.insertAnswer(hospitalQnaVO);
	}


}
