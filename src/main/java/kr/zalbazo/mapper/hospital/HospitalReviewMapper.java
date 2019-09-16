package kr.zalbazo.mapper.hospital;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.zalbazo.model.content.Content;

public interface HospitalReviewMapper {

	public List<Content> getReviewList(@Param("hospitalId") Long hospitalId);

}