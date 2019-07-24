package oil.jang.hs;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import dto.jang.hs.Criteria;
import dto.jang.hs.ReplyPageDTO;
import dto.jang.hs.ReplyVO;
import service.jang.hs.ReplyService;
 
@RequestMapping("/replies/")
@RestController 
public class OilReplyController {
	
	@Autowired
	private ReplyService service;
	
	
	
	//댓글 생성
	@PreAuthorize("isAuthenticated()")  //인증된 사람만 
	@PostMapping(value="/new", consumes="application/json",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) //PostMapping 라서 RequestBody를 사용함 
	{
		 	
		int insertCount=service.register(vo);
		
	  	
		return insertCount==1 ? new ResponseEntity<String>("Success",HttpStatus.OK) 
							  : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	
	
	
	
	//댓글 리스트 조회
	@GetMapping(value="/pages/{bno}/{page}",produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") Integer page,@PathVariable("bno")Long bno)
	{
		Criteria cri=new Criteria(page,10);
		return new ResponseEntity<ReplyPageDTO>(service.getListPage(cri, bno),HttpStatus.OK);
	}
	
	
	
	
	@GetMapping(value="/{rno}",produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno")Long rno)
	{
		return new ResponseEntity<ReplyVO>(service.get(rno),HttpStatus.OK);
	}
	
	
	
	
	
	@DeleteMapping(value="/{rno}",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno")Long rno)
	{
		return service.remove(rno)==1 ? new ResponseEntity<String>("success",HttpStatus.OK)
									  : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
	@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH}
				   ,value="/{rno}"
				   ,consumes="application/json"
				   ,produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@PathVariable("rno")Long rno,@RequestBody ReplyVO vo)
	{
		vo.setRno(rno);
		
		return service.modify(vo)==1 ? new ResponseEntity<String>("success",HttpStatus.OK)
									 : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	 

} 