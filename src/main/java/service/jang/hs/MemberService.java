package service.jang.hs;

import dto.jang.hs.MemberVO;

public interface MemberService {
	
	public int findOnlyId(String userid);

	public void register(MemberVO vo);
	
	public void registerAuth(String userid,String auth);
}
