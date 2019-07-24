package dto.jang.hs;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria { 
	
	private int pageNum; 
	private int amount; 
	
	public Criteria() {  
		this(1,10); 
	}
	
	private String type;
	private String keyword;
	
	public Criteria(int pageNum,int amount)
	{
		this.pageNum=pageNum;
		this.amount=amount;
	}
	
	public String[] getTypeArr() {
		return type==null? new String[] {}:type.split("");
	}

}
