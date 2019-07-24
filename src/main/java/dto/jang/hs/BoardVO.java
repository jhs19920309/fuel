package dto.jang.hs;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private long bno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private Date updateDate;
	
	private int replyCnt;
 
      
}
