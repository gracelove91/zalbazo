package kr.zalbazo.mapper.content;

import java.util.List;

import kr.zalbazo.model.content.Hospital;
import kr.zalbazo.model.content.Label;

public interface HospitalMapper {


    List<Hospital> getList();

    List<Label> getLabelList(Long hospitalId);
    
}

