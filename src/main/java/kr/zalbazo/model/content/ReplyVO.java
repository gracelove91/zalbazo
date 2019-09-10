package kr.zalbazo.model.content;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private Long replyId; // 게시판 댓글id
	private Long contentId; // 게시판 원글id
	
	private String body; // 댓글내용
	private String userEmail; // 댓글 작성자
	private Date createdDate;
	private Date updatedDate;
	
}
