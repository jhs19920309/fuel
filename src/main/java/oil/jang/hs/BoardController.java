package oil.jang.hs; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.jang.hs.BoardVO;
import dto.jang.hs.Criteria;
import dto.jang.hs.MemberVO;
import dto.jang.hs.PageDTO;
import service.jang.hs.BoardService;
import service.jang.hs.MemberService;
 
@Controller
@RequestMapping("/board/*")
public class BoardController {
	

	@Autowired
	private BoardService service;
	
	@Autowired
	MemberService member;
	 
	@PostMapping("/signup") 
	public String signupUser(MemberVO vo)
	{
		member.register(vo);
		member.registerAuth(vo.getUserid(),"ROLE_USER");
		return "redirect:/customLogin";
	}

	
	
	@GetMapping(value="/findOnlyId/{userid}" ,produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public Integer findOnlyId(@PathVariable("userid")String userid) 
	{
		System.out.println(member.findOnlyId(userid));
		return member.findOnlyId(userid);
		
	}
	
	@GetMapping("/signup")
	public void signup()
	{

	}
	
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register()
	{
		System.out.println("글쓰기");
	}
	
	@GetMapping("/list")
	public void list(Model model,Criteria cri)
	{
	 	int total=service.getTotal(cri);
		
		model.addAttribute("list",service.getListWithPaging(cri));
		
		model.addAttribute("pageMaker",new PageDTO(cri,total)); 		 //123은 현재 게시물 임시 개수
	}
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVO board)
	{
		System.out.println(board.getBno());
		System.out.println(board.getContent());
		System.out.println(board.getTitle());
		 
	 		service.register(board);
	
		return "redirect:/board/list";
	}
	
	@GetMapping({"/get","/modify"})
	public void get( @RequestParam("bno") Long bno,Model model,@ModelAttribute("cri")Criteria cri)
	{
		model.addAttribute("board",service.get(bno));
	}
	
	
	@PreAuthorize("principal.username==#board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board,RedirectAttributes rttr,@ModelAttribute("cri")Criteria cri)
	{
	 	
		if(service.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	@PreAuthorize("principal.username==#writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno")Long bno,RedirectAttributes rttr,@ModelAttribute("cri")Criteria cri,String writer)
	{
		System.out.println(bno+"mmmmmmmmmm");
	 	if(service.remove(bno)) {
			rttr.addFlashAttribute("result","success");
			
		}
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());

		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	
	

}
