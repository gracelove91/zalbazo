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
public class HospitalQnaVO {
	
	private Long hospitalQnaId;
	private Long hospitalId;
	private Long contentId;
	private String qnaType;
	private Long cGroup;
	
	private String body;
	private String userEmail;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private Date createdDate;

}
