package kr.zalbazo.model.user;

import java.util.Date;

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
public class Reserve {
	
	private Long reserveId;
	private String note;
	private Date rdate;
	private Long animalId;
	private Long hospitalId;
	private String status;
	private String userEmail;
}
