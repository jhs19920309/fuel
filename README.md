# www.oilfind.shop
OPEN API(오피넷) / 카카오 API 그리고 Spring을 사용한 주유소 최저가 찾기 사이트 




# 1. API에서 유가정보 받아오기  
![image](https://user-images.githubusercontent.com/53259940/64059850-00adcd00-cbff-11e9-9d90-c4974c7e1a2a.png)

<hr>
  
![image](https://user-images.githubusercontent.com/53259940/64059619-ff7aa100-cbfa-11e9-8bb1-4d8866fa5fba.png)
 1.URL경로로 OPEN API에 해당되는 요청 도시 코드를 받는다  
 2.service 메소드로 요청 도시 코드를 넘기고 결과를 HashMap에 담는다  
 3.결과가 정상적으로 저장되면 HashMap을 JSON형태로 리턴하고 비정상적인 결과면 Http Error 메시지를 보낸다  


  
 ![image](https://user-images.githubusercontent.com/53259940/64059806-3aca9f00-cbfe-11e9-8402-05c9b5577686.png)

1.readAvgCityPrice 메소드로 도시코드를 보낸뒤 리턴되는 JSON형태의 문자열을 JSONParser를 이용해 JSON 객체로 생성한다
<pre><code>
 {"RESULT":  {"OIL":[   {"SIDOCD":"01","SIDONM":"서울","PRODCD":"B027","PRICE":1594.82,"DIFF":0.40},   
		   {"SIDOCD":"01","SIDONM":"서울","PRODCD":"B034","PRICE":1905.30,"DIFF":0.36},  
		   {"SIDOCD":"01","SIDONM":"서울","PRODCD":"C004","PRICE":1157.56,"DIFF":3.22}, 
 		   {"SIDOCD":"01","SIDONM":"서울","PRODCD":"D047","PRICE":1458.89,"DIFF":0.44}, 
                             {"SIDOCD":"01","SIDONM":"서울","PRODCD":"K015","PRICE":831.25,"DIFF":-0.14} ] }  }
</code></pre>                       
2.JSON객체 안에서 내가 사용할 key에 해당하는 값을 다시 받는다 ("RESULT")
3.다시 ("RESULT")에서 JSONArray 타입으로 데이터가 있는 OIL키의 값을 받아온다 

