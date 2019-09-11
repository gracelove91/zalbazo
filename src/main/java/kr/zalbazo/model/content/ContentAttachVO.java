package kr.zalbazo.model.content;

import lombok.Data;

@Data
public class ContentAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	
	private Long contentId;
}
