package oil.jang.hs;

 import java.util.ArrayList;



import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;

 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.jang.hs.AroundAllVO2;
import dto.jang.hs.Top10Vo2;
import dto.jang.hs.detail2;
import dto.jang.hs.xy;
import impl.jang.hs.OilServiceImpl;
import service.jang.hs.OilService; 

@Controller
public class HomeController {
	
	@Autowired
	OilService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)    //요청 매핑 방식은 get으로 
	public String home1(Locale locale, Model model) throws Exception { //모델 객체 만들어서 모델에 service클래스의 메소드 결과넣어서 view로 전달
		  model.addAttribute("avgAllPrice",service.getavgAllPrice());
		 
		return "main/OilHome";		//바로 jsp로 넘겨서 자바스크립트 필요 없음
	 
	}
	
	@RequestMapping(value = "/main/OilHome", method = RequestMethod.GET) //요청 매핑 방식은 get으로 
	public void home(Locale locale, Model model) throws Exception {
		  model.addAttribute("avgAllPrice",service.getavgAllPrice());  //바로 jsp로 넘겨서 자바스크립트 필요 없음
	} 
	 
	
	 
	@GetMapping("/main/index")
	public void list(Model model)throws Exception
	{
		 
		  model.addAttribute("avgAllPrice",service.getavgAllPrice()); //바로 jsp로 넘겨서 자바스크립트 필요 없음
	 
	}
	////////////////////////////////////////////////////////////////////////////////////
	
	@GetMapping(value="/getAvgCityPrice/{citycode}" ,produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	//여기 요청URL로 들어오면 {citycode} 데이터를 @PathVariable로 가져와서 -> service 메소드로 넘겨서 결과값을 HashMap으로 받고
	// 이 HashMap을 JSON타입으로 넘긴다 
	@ResponseBody
	public ResponseEntity<HashMap<String, Double>>  getSidoPrice(@PathVariable("citycode")String city) throws Exception
	{
		
		return new ResponseEntity<HashMap<String, Double>>(service.getAvgCityPrice(city),HttpStatus.OK);
	
			
	}
	
	@GetMapping(value="/sm/{num}",produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public LinkedHashMap<String,String> getsm(@PathVariable("num")String num) throws Exception
	{
		LinkedHashMap<String,String> result=null;
		result=service.getSm(num);
	  	
		return result;
	}
	
	@GetMapping(value="/getTop10/{prodcd}/{area}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public ArrayList<Top10Vo2> getlowTop10(@PathVariable("area")String area,@PathVariable("prodcd") String prodcd)throws Exception
	{ 
		ArrayList<Top10Vo2> a=service.getlowTop10(area,prodcd); 
		return a;
	}
	
	@GetMapping(value="/getDistance/{van_addr}/{new_addr}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public xy getDistance(@PathVariable("van_addr")String van_addr,@PathVariable("new_addr")String new_addr)
	throws Exception
	{
		xy result=new xy();
		try {
		 result=OilServiceImpl.getdistance(van_addr,new_addr);
		}catch(Exception e) {
			System.out.println("주소변환 다시");
				result=OilServiceImpl.getdistance(new_addr,van_addr);
				//e.printStackTrace();
		}
		
		 return result;
	} 

	@GetMapping(value="/getDetails/{id}",produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public detail2 map(@PathVariable("id")String id)throws Exception
	{
		detail2 details=service.getDetailInfo(id);
		return details;
	}
	
	@GetMapping(value="/getAroundAll/{x}/{y}/{distance}/{prodcd}/{sort}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public ArrayList<AroundAllVO2> getDistance(@PathVariable("x")String x,@PathVariable("y") String y,
											  @PathVariable("distance") String distance,@PathVariable("prodcd")String prodcd,
											  @PathVariable("sort")String sort)throws Exception
	{ 
		 ArrayList<AroundAllVO2> result=service.getAroundAll(x,y,distance,prodcd,sort); 
		 return result;
	}
	
	@GetMapping(value="/getIdByAddress/{address}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public String getIdByAddress(@PathVariable("address")String address)throws Exception
	{
		
		return service.getIdByAddress(address);
	}

	 
	
}
