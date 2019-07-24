<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
       <script src="/resources/vendor/jquery/jquery.min.js"></script>
        <style>
    .bg-light2{background-color:#f4623a!important  }
  
</style>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>글 등록</title>
 
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
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  
  <body> 
      <header class="bg-light2 py-5">
          <div class="container">
            <div class="small text-center text-muted"></div>
          </div>
        </header>
      <!-- Services Section -->
      <section class="page-section" id="services">
        <div class="container">
 

       <h2 class='text-dark mt-0 text-center mb-3'>게시판</h2>
          <hr class="divider my-4">
          <div class="row">
      
            
        <form role="form" action="/board/register" method="post" class="col-12">
        
          <div class="form-group">
            <label >제목</label> <input class="form-control" name='title'>
          </div>

        
          <div class="form-group">
              <label>내용</label>
              <textarea class="form-control" rows="3" name='content'></textarea>
          </div>
     
          <div class="form-group">
              <label>작성자</label> <input class="form-control" name="writer" value='<sec:authentication property="principal.username"/>' readonly="readonly">
          </div>

			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

          <button type="submit" class="btn btn-primary">등록</button>
          <button type="reset" class="btn btn-primary">Reset Button</button>
    			      
         </form>
	




             
          </div>
        </div>
      </section>
      <!-- Footer -->
  <footer class="bg-light py-5">
      <div class="container">
        <div class="small text-center text-muted">게시판</div>
      </div>
    </footer>
    </body>
</html>


