package dto.jang.hs;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev,next;
	
	private Criteria cri;   //Page DTO 생성시 받아야 하는 핵심 변수
	private int total;		//Page DTO 생성시 받아야 하는 핵심 변수
		
	public PageDTO(Criteria cri,int total) {
		
		this.cri=cri;
		this.total=total;
		
		this.endPage=(int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.startPage=this.endPage-9;
		
		int realEnd=(int)(Math.ceil(total*1.0)/cri.getAmount());
		
		if(realEnd<this.endPage)
		{
			this.endPage=realEnd;
		}
		
		this.prev=this.startPage>1;
		this.next=this.endPage<realEnd;
		
	}
	
	
	
	
}
