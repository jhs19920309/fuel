package impl.jang.hs;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import dto.jang.hs.MemberVO;
import jang.hyun.mapper.MemberMapper;
import service.jang.hs.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper mapper;
	
	@Autowired
    private PasswordEncoder pwencoder;

	public int findOnlyId(String userid)
	{
		int result=mapper.findOnlyId(userid);
		return result;
		 
	}

	public void register(MemberVO vo)
	{
		vo.setUserpw(pwencoder.encode(vo.getUserpw()));
		System.out.println(pwencoder.encode(vo.getUserpw()));
		
		
		mapper.insert(vo);
	}
	
	public void registerAuth(String userid,String auth)
	{
		mapper.insertAuth(userid, auth);
	}
}
