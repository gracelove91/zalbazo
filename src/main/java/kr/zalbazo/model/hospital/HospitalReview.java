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
public class HospitalReview {
	
	private Long reviewId;
	private Long hospitalId;
	private Long contentId;
	private Long startPoint;

}
