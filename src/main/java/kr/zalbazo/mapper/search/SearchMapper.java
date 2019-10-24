package kr.zalbazo.mapper.search;

import java.util.List;
import java.util.Map;

import kr.zalbazo.model.hospital.Hospital;

public interface SearchMapper {

	List<Hospital> listAll(Map map);
	List<Hospital> list(Map map);
	
}
