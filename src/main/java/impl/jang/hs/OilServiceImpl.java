package impl.jang.hs;
 
import java.io.BufferedReader;



import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import dto.jang.hs.AroundAllVO2;
import dto.jang.hs.AvgAllPriceVO2;
import dto.jang.hs.Top10Vo2;
import dto.jang.hs.detail2;
import dto.jang.hs.xy;
import service.jang.hs.OilService;

@Service
public class OilServiceImpl implements OilService {
	
	private static void getFromUrl(BufferedReader reader,StringBuffer buffer) throws IOException
	{ 
          String line;
          while((line=reader.readLine())!=null)
          {
          	buffer.append(line); 
          } 
	}
	 
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	 public String readAvgCityPrice(String sidocode) throws Exception {
		   BufferedReader reader = null;
	      
	        try { 
	        	       URL url = new URL(															 
	                    "http://www.opinet.co.kr/api/"
	                    + "avgSidoPrice.do?out=json"
	                    + "&code=F489190304"
	                    + "&sido="+sidocode
	                    );
	             reader = new BufferedReader(new InputStreamReader(url.openStream()));
	             StringBuffer buffer = new StringBuffer();
	             getFromUrl(reader,buffer); 
	            return buffer.toString();
	        } finally {
	            if (reader != null)
	                reader.close();
	            
	        }
	    }
	    
	  public HashMap<String,Double> getAvgCityPrice(String sidocode) throws Exception{
	        
	        JSONParser jsonparser = new JSONParser();
	        JSONObject jsonobject = (JSONObject)jsonparser.parse(readAvgCityPrice(sidocode));
	        JSONObject json =  (JSONObject) jsonobject.get("RESULT");
	        
	        JSONArray array = (JSONArray)json.get("OIL");
	        
	        HashMap<String,Double> list=new HashMap<String,Double>();
	         
	        for(int i = 0 ; i < array.size(); i++)
	        {  
	            JSONObject entity = (JSONObject)array.get(i);	            
	            list.put((String)entity.get("PRODCD"),(Double)entity.get("PRICE"));
	        }
	        
	        return list;
	        
	  }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
	   
	public String readavgAllPrice() throws Exception {
		 BufferedReader reader = null;
	        
	        try { 
	        	// http://www.opinet.co.kr/api/lowTop10.do?out=json&code=F489190304&prodcd=B027&area=0101
	             URL url = new URL(
	                    "http://www.opinet.co.kr/api/"
	                    + "avgAllPrice.do?out=json"   //A0000035
	                    + "&code=F489190304"
	                    );
	             reader = new BufferedReader(new InputStreamReader(url.openStream()));
	            
	            StringBuffer buffer = new StringBuffer();
	            getFromUrl(reader,buffer); 
	            return buffer.toString();
	        } finally {
	            if (reader != null)
	                reader.close();
	        }
	}

    public AvgAllPriceVO2 getavgAllPrice() throws Exception{
         
         JSONParser jsonparser = new JSONParser();
         
         JSONObject jsonobject = (JSONObject)jsonparser.parse(readavgAllPrice());
         
         JSONObject json =  (JSONObject) jsonobject.get("RESULT");
         
       
         
         JSONArray array = (JSONArray)json.get("OIL");
         
         AvgAllPriceVO2 vo=new AvgAllPriceVO2();
          
         for(int i = 0 ; i < array.size(); i++)
         { 
             
             JSONObject entity = (JSONObject)array.get(i);
            
              if( ((String)entity.get("PRODNM")).equals("고급휘발유"))
              {
            	  vo.setB034_Price((String)entity.get("PRICE"));
            	 
              }
              
              else if( ((String)entity.get("PRODNM")).equals("휘발유"))
              {
            	  vo.setB027_Price((String)entity.get("PRICE"));
            	   
              }
              else if( ((String)entity.get("PRODNM")).equals("자동차용경유"))
              {
            	  vo.setD047_Price((String)entity.get("PRICE"));
             
              }
              else if( ((String)entity.get("PRODNM")).equals("자동차용부탄"))
              {
            	 vo.setK015_Price((String)entity.get("PRICE"));
            	 
              }
              else if(vo.getCurDate()==null)
              {
            	  vo.setCurDate((String)entity.get("TRADE_DT"));
             
              }
               
         }
         return vo;    
    }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
public   LinkedHashMap<String,String> getSm(String area) throws Exception{
        
        JSONParser jsonparser = new JSONParser();
        
       
        JSONObject jsonobject = (JSONObject)jsonparser.parse(readUrl(area));
        
        JSONObject json =  (JSONObject) jsonobject.get("RESULT");
        
      
        
        JSONArray array = (JSONArray)json.get("OIL");
        
        LinkedHashMap<String,String> model=new LinkedHashMap<String,String>(); 
        for(int i = 0 ; i < array.size(); i++)
        { 
              JSONObject entity = (JSONObject)array.get(i);
         
            String City=(String)entity.get("AREA_NM");
        
            String CityCode=(String)entity.get("AREA_CD");
            
             model.put(City,CityCode);
             
        }
        return model;
        
   }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public   String readUrl(String area) throws Exception {
	 BufferedReader reader = null;
    try { 
    						//  	http://www.opinet.co.kr/api/avgSidoPrice.do?out=json&code=F489190304
       
    	URL url=null;
       
        String small="http://www.opinet.co.kr/api/areaCode.do?out=json&code=F489190304&area="+area;
         
        url=new URL(small);
        	 
        reader = new BufferedReader(new InputStreamReader(url.openStream()));
        
        StringBuffer buffer = new StringBuffer();
        getFromUrl(reader,buffer);
        return buffer.toString();
    } finally {
        if (reader != null)
            reader.close();
    }
}
    
    


public   String readlowTop10(String area,String prodcd) throws Exception {
	 BufferedReader reader = null;
       if(area.equals("00"))
       {
    	   area=" ";
    	    
       } 
       
    try { 
     
    	URL url = new URL(
                "http://www.opinet.co.kr/api/"
                + "lowTop10.do?out=json"   
                + "&code=F489190304"
                + "&prodcd="+prodcd
                + "&area="+area
                );
    	 reader = new BufferedReader(new InputStreamReader(url.openStream()));
    	 
       
        StringBuffer buffer = new StringBuffer();
         getFromUrl(reader,buffer);
        return buffer.toString();
    } finally {
        if (reader != null)
            reader.close();
    }
  }

public   ArrayList<Top10Vo2> getlowTop10(String area,String prodcd) throws Exception{
     
     JSONParser jsonparser = new JSONParser();
     JSONObject jsonobject = (JSONObject)jsonparser.parse(readlowTop10(area,prodcd));
     JSONObject json =  (JSONObject) jsonobject.get("RESULT");
  
     JSONArray array = (JSONArray)json.get("OIL");
     
     ArrayList<Top10Vo2> list=new ArrayList<Top10Vo2>();
      
     for(int i = 0 ; i < array.size(); i++)
     { 
         Top10Vo2 oil=new Top10Vo2();
          JSONObject entity = (JSONObject)array.get(i);
 
          oil.setVAN_ADR((String) entity.get("VAN_ADR"));
          oil.setNEW_ADR((String)entity.get("NEW_ADR"));
          oil.setOS_NM((String)entity.get("OS_NM"));
          oil.setPrice((Long)entity.get("PRICE"));
          oil.setUNI_ID((String)entity.get("UNI_ID"));	
        
          list.add(oil);
     }
     return list;
     
}    
    

public static xy getdistance(String van_addr,String new_addr)throws Exception {
	 
    String location = van_addr;
 
    String addr = "https://dapi.kakao.com/v2/local/search/address.json";

    String apiKey = "KakaoAK 99c97591a96ee3ce4c7c164a61dbe013";

    location = URLEncoder.encode(location, "UTF-8");                

    String query = "query=" + location;
    
    StringBuffer stringBuffer = new StringBuffer();     // 문자열 조합 위함
    stringBuffer.append(addr);
    stringBuffer.append("?");
    stringBuffer.append(query);
    
      
    URL url = new URL(stringBuffer.toString());      // 해당 URL에 대한 커넥션 얻기
    
    URLConnection conn = url.openConnection();
    
    conn.setRequestProperty("Authorization", apiKey);  //RequestProperty에 (key,value)를 저장한다.
    
    BufferedReader rd = null;           // 버퍼생성
 
    rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));  // 
    
    StringBuffer docJson = new StringBuffer();
    
    String line;
     
    
    while((line=rd.readLine())!=null){
    	 
        docJson.append(line);
    }
    if(docJson.toString().contains("\"total_count\":0"))   //만약 두번 보내도 주소에맞는 좌표가 돌아오지 않는다면
    		{
    				xy result=new xy();
    				result.setX("No");
    				result.setY("No");
    				return result;
    		}
     
    if(0<docJson.toString().length()){
        System.out.println("docJson    :"+docJson.toString());
        
    }
    
    rd.close();
    JSONParser jsonparser = new JSONParser();
    JSONObject jsonObject =  (JSONObject)jsonparser.parse(docJson.toString());
    
    JSONArray jsonArray= (JSONArray) jsonObject.get("documents");
    
    
    JSONObject tempObj = (JSONObject) jsonArray.get(0);
   
      System.out.println("latitude : " + (String)tempObj.get("y"));
     System.out.println("longitude : " + (String)tempObj.get("x"));
    
    xy result=new xy();
    result.setX((String)tempObj.get("x"));
    result.setY((String)tempObj.get("y"));
    return result;
    
     
	
}



public   String readDetailInfo(String code) throws Exception {
	 BufferedReader reader = null;
    
    try { 
    	// http://www.opinet.co.kr/api/detailById.do?code=F489190304&id=A0000045&out=xml
    	URL url = new URL(
                "http://www.opinet.co.kr/api/"
                + "detailById.do?out=json"   
                + "&code=F489190304"
                + "&id="+code
                );
    	 reader = new BufferedReader(new InputStreamReader(url.openStream()));
        
        StringBuffer buffer = new StringBuffer();
        getFromUrl(reader,buffer);
        return buffer.toString();
    } finally {
        if (reader != null)
            reader.close();
    }
  }

public   detail2 getDetailInfo(String code) throws Exception{
    
    JSONParser jsonparser = new JSONParser();
    
    JSONObject jsonobject = (JSONObject)jsonparser.parse(readDetailInfo(code));
    
    JSONObject json =  (JSONObject) jsonobject.get("RESULT");
  
    
    JSONArray array = (JSONArray)json.get("OIL");
  
   
    
     detail2 list=new detail2();
     
    for(int i = 0 ; i < array.size(); i++)
    { 
         JSONObject entity = (JSONObject)array.get(i);
         list.setVAN_ADR((String) entity.get("VAN_ADR"));
         list.setNEW_ADR((String)entity.get("NEW_ADR"));
         list.setTEL((String)entity.get("TEL"));
         list.setPOLL_DIV_CD((String)entity.get("POLL_DIV_CO"));
       
         list.setOS_NM((String)entity.get("OS_NM"));
         list.setLPG_YN((String)entity.get("LPG_YN"));
         list.setMAINT_YN((String)entity.get("MAINT_YN"));
         list.setCAR_WASH_YN((String)entity.get("CAR_WASH_YN"));
         list.setKPETRO_YN((String)entity.get("KPETRO_YN"));
         list.setCVS_YN((String)entity.get("CVS_YN"));
         
         JSONArray test=(JSONArray)entity.get("OIL_PRICE");
         if(test!=null)
         {
        	 for (int a=0;a<test.size();a++) {
        	 JSONObject temp=(JSONObject)test.get(a);
        	 
        	 String sort=(String)temp.get("PRODCD");
        	 
        	 if(sort.equals("B027"))
        	 {
        		 list.setB027_PRICE((Long)temp.get("PRICE"));
        	 }
        	 if(sort.equals("D047"))
        	 {
        		 list.setD047_PRICE((Long)temp.get("PRICE"));
        	 }
        	 if(sort.equals("K015"))
        	 {
        		 list.setK015_PRICE((Long)temp.get("K015"));
        	 }
        	 
        	 if(sort.equals("B034"))
        	 {  
        		 if(temp.get("B034")==null)
        		 {
        			 list.setB027_PRICE(0);
        		 }
        		 else {
        		 list.setB034_PRICE((Long)temp.get("B034"));
        		 }
        	 }       	 
            }
         }
         
        
    }
    return list;
    
  }

/////////////////////////////////////////////////////////////////////////////////////

public   String readAroundAll(String x,String y,String radius,String prodcd,String sort) throws Exception {
	 BufferedReader reader = null;
    
    try { 
           URL url = new URL(
                "http://www.opinet.co.kr/api/"
                + "aroundAll.do?code=F489190304"
                + "&x="+x
                + "&y="+y
                + "&radius="+radius
                + "&sort="+sort
                + "&prodcd="+prodcd
                + "&out=json"
                );
         reader = new BufferedReader(new InputStreamReader(url.openStream()));
        StringBuffer buffer = new StringBuffer();
       getFromUrl(reader,buffer);
        return buffer.toString();
    } finally {
        if (reader != null)
            reader.close();
    }
}

public   ArrayList<AroundAllVO2> getAroundAll(String x,String y,String radius,String prodcd,String sort) throws Exception{
    
	  JSONParser jsonparser = new JSONParser();
    JSONObject jsonobject = (JSONObject)jsonparser.parse(readAroundAll(x,y,radius,prodcd,sort));
    JSONObject json =  (JSONObject) jsonobject.get("RESULT");
    
    JSONArray array = (JSONArray)json.get("OIL");
    
    ArrayList<AroundAllVO2> list=new ArrayList<AroundAllVO2>();
     
    for(int i = 0 ; i < array.size(); i++)
    {  
        JSONObject entity = (JSONObject)array.get(i);	            
        AroundAllVO2 vo=new AroundAllVO2();
        vo.setDistance((Double)entity.get("DISTANCE"));
        vo.setOs_nm((String)entity.get("OS_NM"));
        vo.setPoll_div_co((String)entity.get("POLL_DIV_CD"));
        vo.setPrice((Long)entity.get("PRICE"));
        vo.setUni_id((String)entity.get("UNI_ID"));
        list.add(vo);
      
    }
    return list;
 }


public String getIdByAddress(String address)throws IOException  {
    try {

        String location = address;

        String addr = "https://dapi.kakao.com/v2/local/search/keyword.json?category_group_code=OL7";

        String apiKey = "KakaoAK 99c97591a96ee3ce4c7c164a61dbe013 ";

        location=URLEncoder.encode(location,"UTF-8"); 
        String query="query="+location;
        
        
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(addr);
        stringBuffer.append("&");
        stringBuffer.append(query);
        
           
        URL url = new URL(stringBuffer.toString());  
           URLConnection conn = url.openConnection();  
        
        conn.setRequestProperty("Authorization", apiKey);
        
        BufferedReader rd = null;
        
        rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
        StringBuffer docJson = new StringBuffer();
        
        String line;
        
        while((line=rd.readLine())!=null){
         
            docJson.append(line);
        }
        
        if(0<docJson.toString().length()){
            System.out.println("docJson    :"+docJson.toString());
            
        }
        
        rd.close();
        JSONParser jsonparser = new JSONParser();
        
        JSONObject jsonObject =  (JSONObject)jsonparser.parse(docJson.toString());
   
        JSONArray jsonArray= (JSONArray) jsonObject.get("documents");
        
        JSONObject tempObj = (JSONObject) jsonArray.get(0);
            
        return (String)tempObj.get("id");
        
    }catch(Exception e) {
        e.printStackTrace();
        return null;
    }
    
}



}
