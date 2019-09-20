package kr.zalbazo.service.search;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.search.SearchMapper;
import kr.zalbazo.model.hospital.Hospital;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchMapper mapper;

	@SuppressWarnings("null")
	@Override
	public List<Hospital> listAll(String searchOption, String keyword, String[] label, String length) throws Exception {
		System.out.println(label);

		ArrayList<String> labell = new ArrayList<String>(Arrays.asList(label));

		System.out.println(labell);
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("label", labell);
		map.put("length", length);

		return mapper.listAll(map);
	}

	@Override
	public List<Hospital> list() throws Exception {
		// TODO Auto-generated method stub

		return mapper.list();
	}
}
