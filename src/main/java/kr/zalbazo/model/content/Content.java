package kr.zalbazo.model.content;

import java.util.Date;
import java.util.List;

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
public class Content { //BoardVO
	
	// 게시판 글
	private Long contentId;
	private String title;
	private String body;
	private String userEmail;
	private Date createdDate;
	private Date updatedDate;
	private Long categoryId;

//	private int replyCnt;
	
	private List<ContentAttachVO> attachList;
}
