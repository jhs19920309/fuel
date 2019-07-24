package security.jang.hs;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import dto.jang.hs.CustomUser;
import dto.jang.hs.MemberVO;
import jang.hyun.mapper.MemberMapper;
 
public class CustomUserDetailsService implements UserDetailsService {
	 
	@Autowired
	private MemberMapper memberMapper;
	@Override
	public UserDetails loadUserByUsername(String username)throws UsernameNotFoundException
	{
	 
		MemberVO vo=memberMapper.read(username);
		return vo == null? null : new CustomUser(vo);
	}
	
	 

} 