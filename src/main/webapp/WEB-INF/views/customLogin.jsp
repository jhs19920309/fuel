<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
 <html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Simple 주유소</title>
 
  <!-- Font Awesome Icons -->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

  <!-- Plugin CSS -->
  <link href="/resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

  <!-- Theme CSS - Includes Bootstrap -->
  <link href="/resources/css/creative.min.css" rel="stylesheet">
 
</head>

<body id="page-top">


 
  <section class="page-section bg-primary" id="about">
    <div class="container">

          


            <div class="row justify-content-center">         
                  
                    
                    <div class="col-lg-4">
                    
                    <div class="jumbotron" style="padding-top:20px;">
                    
                   
                      <form id="userForm" method="post" action="/login">
                    
                        <h3 style="text-align:center;">Simple 주유소</h3>
                      
                       <div class="form-group mt-3">
                        <input type="text" class="form-control " placeholder="아이디" name="username" maxlength="15" required autofocus>
                      </div>
   
                       <div class="form-group">
                       <input type="password" class="form-control" placeholder="비밀번호" name="password" id="userPw" maxlength="20" required autocomplete="off">
                       </div>
                        
   
                       <div class="row justify-content-center"> 
                       <button class="btn btn-primary " id="sendForm">로그인</button>
                       </div>
                       
             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
   
              </form>

                   <a class="row justify-content-center mt-5" href="/board/signup">[회원가입]</a>
                 </div>
             </div>
        
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
  
 
 
 
 
 
 
 
</html>
