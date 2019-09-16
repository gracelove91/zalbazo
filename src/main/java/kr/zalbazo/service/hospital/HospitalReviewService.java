package kr.zalbazo.service.hospital;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.zalbazo.model.content.Content;

public interface HospitalReviewService {
	
	public List<Content> getReviewList(@Param("hospitalId") Long hospitalId);

}
