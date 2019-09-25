package kr.zalbazo.model.content;

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
public class AttachFileDTO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	
	private Long contentId;
	
}
