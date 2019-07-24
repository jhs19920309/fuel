package service.jang.hs;

import java.util.List;


import dto.jang.hs.Criteria;
import dto.jang.hs.ReplyPageDTO;
import dto.jang.hs.ReplyVO;

public interface ReplyService {
	
	
	public int register(ReplyVO vo);
	
	public ReplyVO get(Long rno);
	
	public int modify(ReplyVO vo);
	
	public int remove(Long rno);
	
	public List<ReplyVO> getList(Criteria cri,Long bno);
	
	public ReplyPageDTO getListPage(Criteria cri,Long bno);
	

}
