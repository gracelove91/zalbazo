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
public class FaqVO {
	
	private Long faqId;
	private String question;
	private String answer;
	private String keyword;
	

}
