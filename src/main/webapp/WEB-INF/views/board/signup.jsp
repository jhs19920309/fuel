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



  <!-- About Section -->
  <!-- About Section -->
  <section class="page-section bg-primary" id="about">
    <div class="container">

          


            <div class="row justify-content-center">         
                  
                    
                    <div class="col-lg-4">
                    
                    <div class="jumbotron" style="padding-top:20px;">
                    
                    <form id="userForm" method="post" action="/board/signup">
                    
                     <h3 style="text-align:center;">회원가입</h3>
                    
                    <div class="row form-group ml-1 mt-3">
                    <input type="text" class="form-control col-7 " placeholder="아이디" name="userid" maxlength="15" required autofocus>
                     
                    <button class="btn btn-primary col-3 ml-4" id="checkId">확인</button> 
                    </div>
                     <p class="check3 ml-1" style="color:red; font-size:12px;" ></p>
                    
                    <div class="form-group">
                    <input type="password" class="form-control" placeholder="비밀번호" name="userpw" maxlength="20" required autocomplete="off">
                    </div>

                    <div class="form-group">
                    <input type="password" class="form-control" placeholder="비밀번호 확인"  id="checkPassword" maxlength="20" required autocomplete="off">
                    <p class="check ml-1"  style="color:blue; font-size:12px;"></p> 
                    <p class="check2 ml-1" style="color:red; font-size:12px;" ></p>
                 
                    </div>
                    
                    <div class="form-group">
                    <input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20" required>
                    </div>

                    <div class="row justify-content-center"> 
                    <button class="btn btn-primary" id="sendForm">가입</button>
                    </div>
                    
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

 					</form>
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
 
 
 <script>
 
 function findOnlyId(userid,callback,error){
	 
	 $.getJSON("/board/findOnlyId/"+userid+".json",function(data){
			
				if(callback){
					callback(data);
				}
	
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});	
	}
 
 
 $(document).ready(function(){
      

///////////////////////////////////////////////////////////////////아이디 입력 제한 체크///////////////////////////
var checkIdRestrict=false;

	$("input:text[name='userid']").focusout(function(){

    
	var id=$(this).val();

	var idReg = /^[A-za-z0-9]{5,15}/g;


	if( !idReg.test(id) ) {

		$(".check3").text("영문 대문자 또는 소문자 또는 숫자로 시작 (5~15자) ");

		checkIdRestrict=false;

	}

	else{

		$(".check3").empty();

		checkIdRestrict=true;

		}

  });
///////////////////////////////////////////////////////////////////아이디 중복 체크///////////////////////////
var checkIdDuplicate=false; 
   
		$("#checkId").on("click",function(e){

         e.preventDefault();
      
        if(checkIdRestrict===true){
        	
         var id= $("input:text[name='userid']").val();
          
  
         findOnlyId(id,function(result){
         	 
         	 if(result==1)
         		 {
         		 alert("해당 아이디는 존재합니다.");
         		  checkIdDuplicate=false;
         		 }
         
         	 else{
         		alert("사용 가능합니다.");
				checkIdDuplicate=true;         	 
         	     }
            });
          }
        
        else{
        	 alert("아이디 양식을 지켜주십시오.")
        	 CheckIdRestrict=false;
        }
        
        
        
	  });

      
     

///////////////////////////////////////////////////////////////////비밀번호 체크///////////////////////////
var checkPassword=false;
   
   	
		$("#checkPassword").focusout(function(){
	
			 
			checkPwfn();
     });
		
		$("input:password[name='userpw']").focusout(function(){
			checkPwfn();
		});
		
		
/////////////////////////////////////////////////////////////////비밀번호 체크 함수///////////////////////////		
		function checkPwfn(){
			
			
		       var passwordOne= $("input:password[name='userpw']").val();
		       var passwordTwo= $("#checkPassword").val();
		     
		         if(passwordOne!==""){     
		        	 
		         if(passwordOne===passwordTwo)
		         {
		             $(".check").text("비밀번호가 일치합니다");
		             $(".check2").empty();
		             checkPassword=true;
		         }
		         
		         else{
		             $(".check2").text("비밀번호가 일치하지 않습니다");
		             $(".check").empty();
		             checkPassword=false;
		         }
		         
		         }
		         else{
		        	 	alert("비밀번호를 입력해주세요")
		          }
			   }	
		
		
		
		
		
		
		
 ////////////////////////////////////////////////////////////전송 버튼///////////////////////////////////    
		$("#sendForm").on("click",function(e){

				e.preventDefault();
				
				if(checkIdRestrict===false)
					{
						alert("아이디 양식을 지켜주십시오.");
						return;
					}
				
				
				if(checkIdDuplicate===false)
					{
						alert("아이디 중복 체크를 해주십시오.")
						return;
					}
			 
				if(checkPassword===false)
					{
						alert("패스워드가 일치하지 않습니다")
						return;
					}
		 
				var Form=$("#userForm");
				Form.submit();
		});
		 
		
		
		
		
		
		
     
}); 
 
 </script>
 
 
 
 
 
 
 
 
</html>
