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
	public int removeA(Long contentId) {
		return qnaMapper.deleteContent(contentId);
	}
	
	
    @Transactional
	@Override
	public int removeQnA(Long contentId) {
		
    	int i=0;
		i += qnaMapper.deleteContent(contentId);
		
		// Q에 대한 A의 contentId값을 얻기 
		HospitalQnaVO vo = qnaMapper.getANo(contentId);
		
		// A가 있다면 A도 삭제 
		if(vo != null) {
			Long ano = vo.getContentId();

			i += qnaMapper.deleteContent(ano);			
		}
		
		return i;
	}

    
	@Override
	public List<HospitalQnaVO> getQnaList(Long hospitalId) {
		return qnaMapper.getQnaList(hospitalId);
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
