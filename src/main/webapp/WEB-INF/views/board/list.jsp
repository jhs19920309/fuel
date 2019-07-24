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
   .loginlogout{ color:white;}
</style>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>게시판</title>
 
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
            <div class="small text-center text-muted">
           			
           			<sec:authorize access="isAuthenticated()">
           		 
           			<h2><sec:authentication property="principal.username"/> 님 </h2>
           			<h3><a class="loginlogout" href="/customLogout">[ Logout ]</a></h3>
           			</sec:authorize>
           			
           			<sec:authorize access="isAnonymous()"> 
           			<h2><a class="loginlogout" href="/customLogin">[ Login ]</a></h2>
           			</sec:authorize>
           			
            </div>
          </div>
        </header>
  <section class="page-section" id="services">
    <div class="container">
   <h2 class='text-dark mt-0 text-center mb-3'>게시판</h2>
      <hr class="divider my-4">
      <div class="row">

          <table class="table table-striped" >
              <thead>
                <tr>
                  <th scope="col">번호</th>
                  <th scope="col">제목</th>
                  <th scope="col">작성자</th>
                  <th scope="col">작성일</th>
                  <th scope="col">수정일</th>
                
                </tr>
              </thead>
             
              <tbody>
              
              <c:forEach items="${list}" var="board">
              <tr>
              	<td><c:out value="${board.bno}"/></td>
             
                <td><a class='move' href='<c:out value="${board.bno}"/>'><c:out value="${board.title}"/> </a>
                
                <c:set var="cnt" value="${board.replyCnt}"/>
                <c:if test="${cnt>0}">
                <b>[<c:out value="${board.replyCnt}"/>]</b>
                </c:if>
                 </td> 

              	<td><c:out value="${board.writer}"/></td> 
              	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}"/></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
              </tr>
              </c:forEach>
             
              </tbody>
            </table>
             
        
        
         
      </div>
      	    <div class="row justify-content-center">
         	
         	<button class="btn btn-primary" id="WriteBtn">글쓰기</button>
         	</div>
        <hr class="divider my-4">
         
         <div class="row justify-content-center"> 
        
         <ul class='pagination'>
    
    		<c:if test="${pageMaker.prev}">
    		<li class="paginate_button previous"><a href="${pageMaker.startPage-1}" class="page-link">Prev</a></li>
    		</c:if>
    		
    		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
    		<li class="paginate_button"> <a href="${num}" class="page-link">${num}</a> </li>
    		</c:forEach> 
    		
    		<c:if test="${pageMaker.next}">
    		<li class="paginate_button next"><a href="${pageMaker.endPage+1}"  class="page-link">Next</a></li>
    		</c:if>
    		
       </ul>
        
       </div>
         <hr class="divider my-4">
         
				<div class='row justify-content-center'>
					 

						<form id='searchForm' action="/board/list" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
									or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
									or 내용 or 작성자</option>
							</select>
							
							  <input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
							  <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
							  <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
							  <button class='btn btn-primary'>Search</button>
						
						</form>
				 
				</div>
         
       <!-- 페이징에 사용되는 FORM -->
       <form id='actionForm' action="/board/list" method="get">
       
       <input type="hidden" name='pageNum' value='${pageMaker.cri.pageNum }'>
       <input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
       <input type='hidden' name='type' value='${pageMaker.cri.type}'>
       <input type='hidden' name='keyword' value='${pageMaker.cri.keyword }'/>
       
       </form>
    
     
    </div>
  </section>
   <footer class="bg-light py-5">
      <div class="container">
        <div class="small text-center text-muted">Copyright &copy; 2019 - Start Bootstrap</div>
      </div>
    </footer>
</body>
			<script>
							$("#WriteBtn").on("click",function(e){
							 
						      location.href = '/board/register';
							 
							});
							
							
							var actionForm=$("#actionForm");
							$(".paginate_button a").on("click",function(e){
								
								e.preventDefault();
							
								actionForm.find("input[name='pageNum']").val($(this).attr("href"));
								actionForm.submit();
							
							});
							
							$(".move").on("click",function(e){
								
								e.preventDefault();
								actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
								actionForm.attr("action","/board/get");
								actionForm.submit();
								
							});
							
							var searchForm=$("#searchForm");
							
							$("#searchForm button").on("click",function(e){
								
								if(!searchForm.find("option:selected").val()){
									alert("검색 종류를 선택하세요");
									return false;
								}
								
								if(!searchForm.find("input[name='keyword']").val())
									{
										alert("키워드를 입력하세요");
										return false;
									}
								
								searchForm.find("input[name='pageNum']").val("1");
								e.preventDefault();
								
								searchForm.submit();
								
							});
			
			
			
			</script>


</html>


