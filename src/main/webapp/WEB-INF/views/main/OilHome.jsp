<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html >

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Simeple 주유소 찾기</title>

 
  <!-- Font Awesome Icons -->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

  <!-- Plugin CSS -->
  <link href="/resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

  <!-- Theme CSS - Includes Bootstrap -->
  <link href="/resources/css/creative.min.css" rel="stylesheet">

	<style>
				 div.card {max-width:150px; 
                   min-width:150px;}
	</style>
	
</head>

<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">주유소 찾기</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto my-2 my-lg-0">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#about">도시 평균</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#services">검색</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#portfolio">게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#contact">지도</a>
          
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Masthead -->
  <header class="masthead">
    <div class="container">
    
      <div class="row align-items-center justify-content-center text-center">
        
        <div class="col-lg-8 ">
         
             
            <div class="row justify-content-center mb-5">

            <select class="form-control mr-2"  id="distance"  style="max-width:8rem;">
            <option value="" selected disabled hidden>거리</option>
            <option value="1000">1km</option>
            <option value="3000">3km</option>
            <option value="5000">5km</option>
            </select>

            <select class="form-control mr-2"  id="prodcd"   style="max-width:8rem;">
              <option value="" selected disabled hidden>종류</option>
              <option value="B027">휘발유</option>
              <option value="D047">경유</option>
              <option value="B034">고급 휘발유</option>
              <option value="K015">LPG</option> 
            </select>

            <select class="form-control"        id="sort"   style="max-width:8rem;">
              <option value="" selected disabled hidden>정렬</option>
              <option value="1">가격순</option>
              <option value="2">거리순</option>
            </select>
            
             <button class="btn btn-primary ml-2" id="aroundSearch" >찾기</button>
            
          </div>
            <table class="table table-striped text-white">
              <thead>
              <tr>
                <th scope="row">순위</th>
                <th scope="row">상호명</th>
                <th scope="row">가격</th>
                <th scope="row">거리</th>
                <th scope="row">지도</th>
              </tr>
              </thead>
              <tbody id="AroundAlltable">
             
             <!--      <tr id="Around1">
                  <th scope="row">1</th>
                  </tr>
                  
                  <tr id="Around1">
                  <th scope="row">2</th>
                  </tr>
                  
                  <tr id="Around1">
                  <th scope="row">3</th>
                  </tr>
                  
                  <tr id="Around1">
                  <th scope="row">4</th>
                  </tr>
                  
                  <tr id="Around1">
                  <th scope="row">5</th>
                  </tr>
                 -->  

              </tbody>
            </table>

					  <ul class="pagination">
                 <!--      <li class="paginate_button page-item active">
                        <a href="#" data-dt-idx="4" class="page-link">1</a> 
                      </li>
                       -->
                    </ul>

            </div>
              
        </div>
      </div>
     
  </header>
 
  <!-- About Section -->
  <section class="page-section bg-primary" id="about">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 text-center">
         <h2 class="text-white mt-0 mb-4">전국 주유소 평균 가격</h2>
          <!--휘발유 카드-->
           <div class="row justify-content-center mb-4">

          <div class="card border-dark mb-3"  >
            <div class="card-header">휘발유</div>
            <div class="card-body text-dark">
              <h5 class="card-title"><c:out value="${avgAllPrice.b027_Price}"/></h5>   
           </div>
          </div>
           
          
          
           <!--휘발유 카드-->
           <div class="card border-dark mb-3"  >
            <div class="card-header">경유</div>
            <div class="card-body text-dark">
              <h5 class="card-title"><c:out value="${avgAllPrice.d047_Price}"/></h5>
           </div>
          </div>
           <!--휘발유 카드-->
           <div class="card border-dark mb-3"  >
            <div class="card-header">고급 휘발유</div>
            <div class="card-body text-dark">
              <h5 class="card-title"><c:out value="${avgAllPrice.b034_Price}"/></h5>
           </div>
          </div>
           <!--휘발유 카드-->
           <div class="card border-dark mb-3"  >
            <div class="card-header">LPG</div>
            <div class="card-body text-dark">
              <h5 class="card-title"><c:out value="${avgAllPrice.k015_Price}"/></h5>
           </div>
          </div>

          </div>

         <h2 class="text-white mt-3 mb-3">전국 시/도별 평균 가격</h2>
          <div class="container" id="selectcity" style="max-width: 8rem;"> 
            <select class="form-control mb-3">
                     <option value='01'>서울</option>
		             <option value='02'>경기</option>
		             <option value='03'>강원</option>
		             <option value='04'>충북</option>
		             <option value='05'>충남</option>
		             
		             <option value='06'>전북</option>
		             <option value='07'>전남</option>
		             <option value='08'>경북</option>
		             <option value='09'>경남</option>
		             <option value='10'>부산</option>
		             
		             <option value='11'>제주</option>
		             <option value='14'>대구</option>
		             <option value='15'>인천</option>
		             <option value='16'>광주</option>
		             <option value='17'>대전</option>
		             
		             <option value='18'>울산</option>
		             <option value='19'>세종</option>
          
            </select>
          </div>
          
          <!--휘발유 카드-->
          <div class="row justify-content-center">

 
          <div class="card border-dark mb-3"  >
            <div class="card-header">휘발유</div>
            <div class="card-body text-dark">
              <h5 class="card-title" id="selectcityB027"></h5>
           </div>
          </div>
 
           <!--휘발유 카드-->
       
           <div class="card border-dark mb-3" >
            <div class="card-header">경유  </div>
            <div class="card-body text-dark">
              <h5 class="card-title" id="selectcityD047"></h5>
           </div>
          </div>
      
           <!--휘발유 카드-->
       
           <div class="card border-dark mb-3"  >
            <div class="card-header">고급 휘발유</div>
            <div class="card-body text-dark">
              <h5 class="card-title" id="selectcityB034"></h5>
           </div>
          </div>

           <!--휘발유 카드-->
          
           <div class="card border-dark mb-3"  >
            <div class="card-header">LPG</div>
            <div class="card-body text-dark">
              <h5 class="card-title" id="selectcityK015"></h5>
           </div>
          </div>
       

          </div>



          
         
        </div>
      </div>
    </div>
  </section>
 

  <!-- Services Section -->
  <section class="page-section" id="services">
    <div class="container">
    <h2 class="text-dark mt-0 text-center mb-3">TOP 10 주유소 찾기</h2>
  <div class="row justify-content-center"> 
        <select class="form-control"  id="Top10Sido"  style="max-width: 8rem;" >
        <option value="00">전국</option>
        
        <option value='01'>서울</option>
        <option value='02'>경기</option>
        <option value='03'>강원</option>
        <option value='04'>충북</option>
        <option value='05'>충남</option>
        
        <option value='06'>전북</option>
        <option value='07'>전남</option>
        <option value='08'>경북</option>
        <option value='09'>경남</option>
        <option value='10'>부산</option>
        
        <option value='11'>제주</option>
        <option value='14'>대구</option>
        <option value='15'>인천</option>
        <option value='16'>광주</option>
        <option value='17'>대전</option>
        
        <option value='18'>울산</option>
        <option value='19'>세종</option>
     </select>

     <select class="form-control" id="underselect"  style="max-width: 8rem;">
     <option value=''>--</option>
      </select>

      <select class="form-control col-xs-2 " id="oilselect" style="max-width: 8rem;">
          <option value='B027'>휘발유</option>
          <option value='B034'>고급 휘발유</option>
          <option value='D047'>경유</option>
          <option value='K015'>LPG</option>
      </select>
      
       <button class="btn btn-primary ml-2" id="top10Search">찾기</button>
            
        </div>


      <hr class="divider my-4">
      <div class="row">

          <table class="table table-striped" id="table123">
              <thead>
                <tr>
                   <th scope="col">순위</th>
                   <th scope="col">지역</th>
            	   <th scope="col">상호명</th>   
                   <th scope="col">가격</th>
                   <th scope="col">지도</th>
                   <th scope="col">거리</th>
                </tr>
              </thead>
         
              <tbody>
                <tr id="top1">
                  <th scope="row">1</th>
                 
                </tr>
                <tr id="top2">
                  <th scope="row">2</th>
                   
                </tr>
                <tr  id="top3">
                  <th scope="row">3</th>
                  
                </tr>
                <tr id="top4">
                  <th scope="row">4</th>
                  
                </tr>
                <tr id="top5">
                  <th scope="row">5</th>
                  
                </tr>
                <tr id="top6">
                  <th scope="row">6</th>
                
                </tr>
                <tr id="top7">
                  <th scope="row">7</th>
                   
                </tr>
                <tr id="top8">
                  <th scope="row">8</th>
                 
                </tr>
                <tr id="top9">
                  <th scope="row">9</th>
                   
                </tr>
                <tr  id="top10">
                  <th scope="row">10</th>
                 
                </tr>
             
              </tbody>
            </table>
        
        
         
      </div>
    </div>
  </section>



















  <!-- Portfolio Section -->
  <section id="portfolio">
   <!--  <div class="container-fluid p-0">
      <div class="row ">
       
          <div id="staticMap" style="width:100%;height:350px;"></div>

      </div>
    </div>-->
  </section>

  <!-- Call to Action Section -->
  <section class="page-section bg-dark text-white">
    <div class="container text-center">
      <h2 class="mb-4">게시판</h2>
      <a class="btn btn-light btn-xl" href="/board/list">게시판 바로가기</a>
    </div>
  </section>

  <!-- Contact Section -->
  <section class="page-section" id="contact">
  
   <div class="container">
      <div class="row justify-content-center">
     <!--
      <div class="col-3"> -->
      <div id="map" class="border border-primary rounded mb-5 " style="width:1300px;height:550px;"></div>
      
      <div id='div1'class="w-100"></div>
	
	<!--   <div class="col-7 "> -->
	  	<table class="table mt-3 " style="width:1300px;">							 
  		  <tbody >
   
    <tr>
      <th scope="row" class="primary">상호명 </th>
      <td id="os_nm"></td>
      <th scope="row">상표</th>
      <td id="poll_div_cd"></td>
    </tr>
   
    <tr>
      <th scope="row">지번 주소</th>
      <td id="van_adr"></td>
      <th scope="row">도로명 주소</th>
      <td id="new_adr"></td>
    </tr>
   
    <tr>
      <th scope="row">전화번호</th>
      <td id="tel"></td>
      <th scope="row">업종 구분 </th>
      <td id="lpg_yn"></td>
    </tr>
    
      <tr>
      <th scope="row">경정비 시설</th>
      <td id="maint_yn"></td>
      <th scope="row">세차장 </th>
      <td id="car_wash_yn"></td>
      </tr>
      
      <tr>
       <th scope="row">품질 인증 </th>
      <td id="kpetro_yn"></td>
       <th scope="row">편의점 여부 </th>
      <td id="cvs_yn"></td>
     </tr>
     
     <tr >
     <th scope="row"> 휘발유</th>
     <td colspan='3' id="detailB027Price"> X </td>
     </tr>
     
     <tr >
     <th scope="row"> 경유</th>
    <td colspan='3' id="detailD047Price">X</td>
     </tr>
     
      <tr>
     <th scope="row"> 고급휘발유</th>
     <td colspan='3' id="detailB034Price">X</td>
     </tr>
     
      <tr>
     <th scope="row"> LPG</th>
     <td colspan='3' id="detailK015Price">X</td>
     </tr>
     
      
  </tbody>
  </table>
   <button class='btn btn-primary mt-3' id="FindRoad">길찾기 바로가기</button>
	  </div>
       </div>
      		 
  
  </section>

  <!-- Footer -->
  <footer class="bg-light py-5">
    <div class="container">
      <div class="small text-center text-muted">Simple 주유소</div>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/resources/js/creative.min.js"></script>

  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=99c97591a96ee3ce4c7c164a61dbe013&libraries=services"></script>
 
  <script src='/resources/js/proj4js-combined.js'></script>
    <script src="/resources/js/myFunc2.js"></script>
</body>


<script>

   
if (document.location.protocol == 'http:' && document.URL!="http://localhost:8080/") {
    document.location.href = document.location.href.replace('http:', 'https:');
}
    
    </script>


</html>
