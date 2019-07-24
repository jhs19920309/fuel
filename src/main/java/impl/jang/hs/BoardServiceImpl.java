package impl.jang.hs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.jang.hs.BoardVO;
import dto.jang.hs.Criteria;
import jang.hyun.mapper.BoardMapper;
import service.jang.hs.BoardService;
 
@Service 
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;

	public void register(BoardVO board) 
	{
		  mapper.insertSelectKey(board);	 
	}
	
	public BoardVO get(Long bno)
	{
		return mapper.read(bno);
	}
	
	public boolean modify(BoardVO board)
	{
		return mapper.update(board)==1;
	}
	
	public boolean remove(Long bno)
	{
		return mapper.delete(bno)==1;
		
	}
	/*
	public List<BoardVO> getList()
	{
		return mapper.getList();
	}*/
	
	public List<BoardVO> getListWithPaging(Criteria cri)
	{
		return mapper.getListWithPaging(cri);
	}
	
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

}
