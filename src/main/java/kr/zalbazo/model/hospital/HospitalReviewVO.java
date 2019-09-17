package kr.zalbazo.model.hospital;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
public class HospitalReviewVO {
	
	private Long reviewId;
	private Long hospitalId;
	private Long contentId;
	private double starPoint;
	
	private String body;
	private String userEmail;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private Date createdDate;
	private Long categoryId;

}
