package kr.zalbazo.model.user;

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
public class MessageVO {
	
	private Long messageId;
	private Long contentId;
	private String type;
	private Long mGroup;
	
	private String name;
	
	private String body;
	private String userEmail;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private Date createdDate;

}
