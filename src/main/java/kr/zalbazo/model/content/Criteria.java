package kr.zalbazo.model.content;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum;
	private int amount;
	private Long category;
	
	public Criteria() {
		this.pageNum = 1;
		this.amount = 10;
	}
	
	public Criteria(Long category) {
		this.pageNum = 1;
		this.amount = 10;
		this.category = category;
	}
	
	public Criteria(int pageNum, int amount, Long category) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.category = category;
	}

}
