# www.oilfind.shop
OPEN API(오피넷) / 카카오 API 그리고 Spring을 사용한 주유소 최저가 찾기 사이트 




# 1. API에서 유가정보 받아오기  
![image](https://user-images.githubusercontent.com/53259940/64059850-00adcd00-cbff-11e9-9d90-c4974c7e1a2a.png)

<hr>
  
![image](https://user-images.githubusercontent.com/53259940/64059619-ff7aa100-cbfa-11e9-8bb1-4d8866fa5fba.png)
 1.) URL경로로 OPEN API에 해당되는 요청 도시 코드를 받는다  
 2.) service 메소드로 요청 도시 코드를 넘기고 결과를 HashMap에 담는다  
 3.) 결과가 정상적으로 저장되면 HashMap을 JSON형태로 리턴하고 비정상적인 결과면 Http Error 메시지를 보낸다  


  
 ![image](https://user-images.githubusercontent.com/53259940/64059806-3aca9f00-cbfe-11e9-8402-05c9b5577686.png)

1.) readAvgCityPrice 메소드로 도시코드를 보낸뒤 리턴되는 JSON형태의 문자열을 JSONParser를 이용해 JSON 객체로 생성한다
<pre><code>
 {"RESULT":  {"OIL":[   {"SIDOCD":"01","SIDONM":"서울","PRODCD":"B027","PRICE":1594.82,"DIFF":0.40},   
		   {"SIDOCD":"01","SIDONM":"서울","PRODCD":"B034","PRICE":1905.30,"DIFF":0.36},  
		   {"SIDOCD":"01","SIDONM":"서울","PRODCD":"C004","PRICE":1157.56,"DIFF":3.22}, 
 		   {"SIDOCD":"01","SIDONM":"서울","PRODCD":"D047","PRICE":1458.89,"DIFF":0.44}, 
                             {"SIDOCD":"01","SIDONM":"서울","PRODCD":"K015","PRICE":831.25,"DIFF":-0.14} ] }  }
</code></pre>                       
2.) JSON객체 안에서 내가 사용할 key에 해당하는 값을 다시 받는다 ("RESULT")  
3.) 다시 ("RESULT")에서 JSONArray 타입으로 데이터가 있는 OIL키의 값을 받아온다 

![image](https://user-images.githubusercontent.com/53259940/64059918-4028e900-cc00-11e9-97c0-19863bad12c9.png)
![image](https://user-images.githubusercontent.com/53259940/64059921-50d95f00-cc00-11e9-8081-c2dacc7f95f9.png)

 1.) 정보를 받고자하는 URL주소로 URL 객체를 생성해서 준비한다 URL주소와 연결한 뒤 이 연결로부터 입력받을 수 있는 InputStream 객체를 받고
     이 객체를 BufferedReader 생성자로 넣는다.

 2.) InputStream으로 받은 것은 해당 URL이 반환하는 데이터 이고  www.oilfind.shop으로 하면 내 컨트롤러에서는 
     jsp를 반환하기때문에 <html><body>부터 끝까지 모든 스크립트정보가 반환된다.  
	
 3.) 하지만 내가 설정한 URL은 JSON의 데이터를 문자열로 받게된다, 이것들을 다시 StringBuffer에 저장한다  
     JSONParser 를 사용해 JSON형태의 문자열을 json객체로 만들어준다  
     
**결과적으로 HashMap<String,Double> 형태로 데이터가 완성되어 리턴된다**  
Result : {D047=1458.89, B034=1905.3, K015=831.25, B027=1594.82, C004=1157.56}

<hr>

# 2. 내 주변 위치 주유소 유가 정보 가져오기  


![image](https://user-images.githubusercontent.com/53259940/64060048-68194c00-cc02-11e9-8263-471d708fe735.png)

**HTML5 Geolocation 사용함, 로컬에서는 메소드 실행시 정상적으로 현재의 위도 경도를 반환해주지만 호스팅시 HTTPS를 적용해야 사용 가능** 


