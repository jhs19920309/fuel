package service.jang.hs;

import java.util.List;

import dto.jang.hs.BoardVO;
import dto.jang.hs.Criteria;

public interface BoardService {

	
	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
//	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	
}
