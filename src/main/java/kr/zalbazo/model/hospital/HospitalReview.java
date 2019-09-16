package kr.zalbazo.model.hospital;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@AllArgsConstructor
@Getter
@Setter
public class HospitalReview { // VO
	
	private Long reviewId; // 리뷰DB번호
	private Long hospitalId; // 병원번호
	private Long contentId; // 글번호
	private Long starPoint; // 별점

}
