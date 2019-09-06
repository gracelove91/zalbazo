package kr.zalbazo.model.content;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		
		// pageNum, amount
		// Criteria(1, 10)
		this.cri = cri;
		// 전체 데이터 수 
		this.total = total;
		
		// EX) << 11~20 >>
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd =  (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		// 마지막 pageNum(?)이 8인데 endPage가 10이라고 뜨면 실제 마지막 pageNum은 8
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
	}

}
