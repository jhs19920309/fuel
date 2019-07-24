package jang.hyun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import dto.jang.hs.BoardVO;
import dto.jang.hs.Criteria;

public interface BoardMapper {
	
 
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);    //insert만 처리되고 PK 값을 알 필요가 없는 경우
	
	public void insertSelectKey(BoardVO board); // insert문이 실행되고 생성된 PK 값을 알아야 하는 경우 
	
	public BoardVO read(long bno);
	
	public int delete(long bno);
	
	public int update(BoardVO board);
	
	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("bno") Long bno,@Param("amount")int amount);
	
	 

}
