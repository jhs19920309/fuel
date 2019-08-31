# www.oilfind.shop
OPEN API(오피넷) / 카카오 API 그리고 Spring을 사용한 주유소 최저가 찾기 사이트 




# 1. API에서 유가정보 받아오기  
<hr>
![image](https://user-images.githubusercontent.com/53259940/64059850-00adcd00-cbff-11e9-9d90-c4974c7e1a2a.png)  
<hr>
  
![image](https://user-images.githubusercontent.com/53259940/64059619-ff7aa100-cbfa-11e9-8bb1-4d8866fa5fba.png)
 1.URL경로로 OPEN API에 해당되는 요청 도시 코드를 받는다  
 2.service 메소드로 요청 도시 코드를 넘기고 결과를 HashMap에 담는다  
 3.결과가 정상적으로 저장되면 HashMap을 JSON형태로 리턴하고 비정상적인 결과면 Http Error 메시지를 보낸다  


  
 ![image](https://user-images.githubusercontent.com/53259940/64059806-3aca9f00-cbfe-11e9-8402-05c9b5577686.png)


