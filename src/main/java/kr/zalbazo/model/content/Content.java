package kr.zalbazo.model.content;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import kr.zalbazo.model.pic.AttachFileDTO;
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
	
	@NotNull
	private String title;
	@NotNull
	private String body;
	@NotNull
	private String userEmail;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private Date createdDate;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private Date updatedDate;
	private Long categoryId;
	private String name;
	
	private List<AttachFileDTO> attachList;

}
