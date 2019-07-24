<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

  <title>Creative - Start Bootstrap Theme</title>
 
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
      
            
        <form role="form" action="/board/modify" method="post" class="col-12">
        
        
        
          <div class="form-group">
            <label >번호</label> 
            <input class="form-control" name='bno' value=<c:out value="${board.bno}"/> readonly >
          </div>
          
        
          <div class="form-group">
            <label >제목</label> <input class="form-control" name='title' value=<c:out value="${board.title}"/>     >
          </div>

        
          <div class="form-group">
              <label>내용</label>
              <textarea class="form-control" rows="3" name='content'><c:out value="${board.content}"/></textarea>
          </div>
     
          <div class="form-group">
              <label>작성자</label> <input class="form-control" name='writer' value=<c:out value="${board.writer}"/>  readonly>
          </div>


			<sec:authentication property="principal" var="pinfo"/>
			<sec:authorize access="isAuthenticated()">
			<c:if test="${pinfo.username eq board.writer}">
			
           <button type="submit" data-oper='modify' class="btn btn-primary mr-3" >수정 등록</button>
           <button type="submit" data-oper='remove' class="btn btn-danger mr-3" >글 삭제</button>
           
           </c:if>
           </sec:authorize>
           
           <button type="submit" data-oper='list'   class="btn btn-primary">글 목록</button>
           
           
           
            <input type='hidden'  name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
            <input type='hidden'  name='amount' value='<c:out value="${cri.amount}"/>'> 
            <input type='hidden' name='type' value='${cri.type}'>
            <input type='hidden' name='keyword' value='${cri.keyword }'/>
     
           	
           	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
           
         </form>





             
          </div>
        </div>
      </section>
      <!-- Footer -->
  <footer class="bg-light py-5">
      <div class="container">
        <div class="small text-center text-muted">Copyright &copy; 2019 - Start Bootstrap</div>
      </div>
    </footer>
    </body>
    
    
    <script>
    			$(document).ready(function(){
    				
    				var formObj=$("form");
    				
    				$('button').on("click",function(e){
    					
    					e.preventDefault();
    					
    					var operation=$(this).data("oper");
    					
    					console.log(operation);
    					
    					if(operation==='remove'){
    						formObj.attr("action","/board/remove");
    					}
    					
    					else if(operation==='list'){
    						formObj.attr("action","/board/list").attr("method","get");
    						
    						var pageNumTag=$("input[name='pageNum']").clone();
    						var amountTag=$("input[name='amount']").clone();
    						
    						var keywordTag=$("input[name='keyword']").clone();
    						var typeTag=$("input[name='type']").clone();
    						
    						
    						console.log(pageNumTag);
    						console.log(amountTag);
    						console.dir(pageNumTag);
    						console.dir(amountTag);
    						
    						formObj.empty();
    						formObj.append(pageNumTag);
    						formObj.append(amountTag);
    				  		formObj.append(keywordTag);
    				  		formObj.append(typeTag);
    						
    					}
    					
    					formObj.submit();
    					 
    				});
    				
    				
    				
    				
    			});
    
    </script>
    
    
    
    
</html>


