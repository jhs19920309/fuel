package jang.hyun.mapper;

import org.apache.ibatis.annotations.Param;

import dto.jang.hs.MemberVO;

 
public interface MemberMapper {
	
	public MemberVO read(String userid); 
	
	public int findOnlyId(String userid);
	
	public void insert(MemberVO vo);
	
	public void insertAuth(@Param("userid") String userid,@Param("auth")String auth);

}
