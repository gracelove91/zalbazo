package kr.zalbazo.model.content;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

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
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private Date createdDate;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private Date updatedDate;
	private Long categoryId;

}
