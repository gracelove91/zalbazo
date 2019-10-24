package kr.zalbazo.model.content;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private Long replyid;
	private Long contentId;
	
	private String body;
	private String userEmail;
	private Date createdDate;
	private Date updatedDate;
	
}
