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
       hr.divider2 {
 
    border-width: .2rem;
    border-color: #f4623a;
}  

  hr.divier3{
    border-width: .2rem;
    border-color:#e9ecef;
 
  }
.color-orange {
  background: #e9ecef;

 
}
  
</style>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>게시글</title>
 
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
      
            
        
           <div class="col-12">
          
          <div class="form-group">
            <label >번호</label> 
            <input class="form-control" name='bno' value='<c:out value="${board.bno}"/>' readonly>
          </div>
          
          
          
          <div class="form-group">
            <label >제목</label> 
            <input class="form-control" name='title' value='<c:out value="${board.title}"/>' readonly>
          </div>

        
          <div class="form-group">
              <label>내용</label>
              <textarea class="form-control" rows="3" name='content' readonly><c:out value="${board.content}"/></textarea>
          </div>
     
          <div class="form-group">
              <label>작성자</label> 
              <input class="form-control" name='writer' value='<c:out value="${board.writer}"/>' readonly>
          </div>
		
		
		
       	  <sec:authentication property="principal" var="pinfo"/> 
       	  <sec:authorize access="isAuthenticated()">
       	  <c:if test="${pinfo.username eq board.writer}">
      
    	  <button data-oper='modify' class="btn btn-primary">수정</button>
        
       	  </c:if> 
       	  </sec:authorize>
       	 
       	  
          <button data-oper='list'   class="btn btn-primary">목록</button>
         
          <form id="operForm" action="/boad/modify" method="get">
          
          <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
          <input type='hidden'  name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
          <input type='hidden'  name='amount' value='<c:out value="${cri.amount}"/>'> 
           <input type='hidden' name='type' value='${cri.type}'>
      	 <input type='hidden' name='keyword' value='${cri.keyword }'/>
     
          
          </form>
          
         
              </div>	
          </div>
          
            <hr class="divider2 my-4"   >
       <div class="row"> 
          <div class="col-12">
             
              <div class="panel">
                  <div class="panel-heading color-orange mb-3" >
                    <i class="fa fa-comments fa-fw"></i> 댓글목록
                  
                  </div>

                  <div class="panel-body">

                    <ul class="chat">
 
                    </ul>
                  </div>  <!--panel body-->
                  
          <div class='panel-footer'>
          <hr class="divider my-4">
         
         <div class="row justify-content-center"> 
        
         <ul class='pagination'>
    <!--  
    		<c:if test="${pageMaker.prev}">
    		<li class="paginate_button previous"><a href="${pageMaker.startPage-1}" class="page-link">Prev</a></li>
    		</c:if>
    		
    		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
    		<li class="paginate_button"> <a href="${num}" class="page-link">${num}</a> </li>
    		</c:forEach> 
    		
    		<c:if test="${pageMaker.next}">
    		<li class="paginate_button next"><a href="${pageMaker.endPage+1}"  class="page-link">Next</a></li>
    		</c:if>
    		 -->
       </ul>
        
          </div>

       </div>
                  
                  
    </div>  <!-- panel panel-primary-->
              
              
              <sec:authorize access="isAuthenticated()">
             <div class="panel">
                <div class="panel-heading color-orange mb-3" >
                    <i class="fas fa-pencil-alt prefix"></i> 댓글쓰기 
                 </div>

                 <div class="panel-body">
                    <input class="form-control mb-2 mt-2" maxlength='8' id="commenter" readonly>
                    <textarea class="form-control" rows="5" id="comment"></textarea>
                    <button id='addReplyBtn' class='btn btn-primary pull-right mt-3'>등록</button>
                </div>
             </div>
             </sec:authorize>
              
              
              
              
            </div>
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
    
    
<script src="/resources/js/reply.js"></script>
	
		<script>
		var loginCommenter="";
	  	  var csrfHeaderName="${_csrf.headerName}";
	  	  var csrfTokenValue="${_csrf.token}";
	  	  
	  	 $(document).ajaxSend(function(e,xhr,options){
				
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
				
			});
		
		$(document).ready(function(){

			 
			
			<sec:authorize access="isAuthenticated()">
			
			loginCommenter='<sec:authentication property="principal.username"/>';
			
			</sec:authorize>
			
			<sec:authorize access="isAnonymous()">
			
			loginCommenter=null;
			
			</sec:authorize>
			
			
		   $("#commenter").val(loginCommenter);
			
		  
	});
		 


	  	  			var check=true;
		            
	  	  			$(document).ready(function(){
		            	
		            	var operForm=$("#operForm");
		            	
		            	$("button[data-oper='modify']").on("click",function(e){
		            		
		            		operForm.attr("action","/board/modify").submit();
		            		
		            	});
		            	
					    $("button[data-oper='list']").on("click",function(e){
		            		
					    	operForm.find("#bno").remove();
					    	operForm.attr("action","/board/list").submit();
		            		
		            	});
		          
		            });
		            
		          $(document).ready(function(){
		        	
		        	  var bnoValue='<c:out value="${board.bno}"/>';
			          var replyUL=$(".chat");
			          
			          showList(1);
			          
			          function showList(page){
			        	  
			        	  replyService.getList({bno:bnoValue,page:page||1},function(replyCnt,list){
			        		 
			        		  console.log("replyCnt  "+replyCnt);
			        		  console.log(list);
			        		 
			        		  if(page==-1)
			        			  {
			        			  		pageNum=Math.ceil(replyCnt/10.0);
			        			  		showList(pageNum);
			        			  		return;
			        			  }
			        		  
			        		  var str="";
			        		  
			        		  if(list==null||list.length==0){
			        			  replyUL.html("");
			        			  return; 
			        		  }
			        		 
			        		//  loginCommenter2 랑 그 댓글 작성자랑 같은때 버튼보여주기
			        		  
			        		 
			        		  var buttonOfModify="";
		        			  var buttonOfRemove="";
		        			  	
			        		  for( var i=0, len=list.length||0; i<len; i++)
			        			  {
			        			  	 
			        			  	if( (list[i].replyer)===loginCommenter)
			        			  		{
			        			  					buttonOfModify="<button class='btn btn-outline-primary ml-3' data-rno='"+list[i].rno+"'"+"name='modifyReplyBtn'>수정</button>";
			        			  					buttonOfRemove="<button class='btn btn-outline-primary' data-rno='"+list[i].rno+"'"+" name='removeReplyBtn'>삭제</button> ";
			        			  		}
			        			    str+="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
			        			    str+="  <div><div class='header'><strong class='mr-3'>"+list[i].replyer+"</strong>";
			        			    str+="    <small>"+replyService.displayTime(list[i].replyDate)+"</small>"+buttonOfModify;
			        			    str+= buttonOfRemove+"</div><p>"+list[i].reply+"</p></div><hr class='divider3 my-4'></li>";
			        				
			        			    buttonOfModify="";
			        			    buttonOfRemove="";
			        			  }
			        		  
			        		  replyUL.html(str);
			        		  
			        		  showReplyPage(replyCnt);
			        	 
			        	  });  // End function(list)
			        	  
						   
			        	  
			        	 
			        	  
			          }// End ShowList
		        	   
			          
			         
			        	  
			        	  
			          $("#addReplyBtn").on("click",function(e){
			        	 
			        	  var comment=$("#comment");
			        	  var commenter=$("#commenter");
			        	  
			        		var reply={ reply:comment.val(),replyer:commenter.val(),bno:bnoValue};
			        		
			        		replyService.add(reply,function(result){
			        			
			        			alert(result);
			        			comment.val("");
			        		//	commenter.val(""); 이거 하면 댓글등록후 작성자이름 없어져서 DB null 익셉션 발생 이걸 왜 넣은지 모르겠음
			        	 	showList(-1);
			        		});
			          });  //End addReplyBtn
			          
			          
			          
			          ////////////////// //////댓글 수정////////
			         
		              $(".chat").on("click","button",function(e){

		            	  if(check){
		            		  
		                  if($(this).attr("name")==='removeReplyBtn')
		                  {
		                    
		                    replyService.remove($(this).data("rno"),function(result){

		                           alert(result);
		                           showList(pageNum);

		                    });
		                    return;
		                  }
		                  
		            	   
		                var rno=$(this).data("rno");
		                 
		                 var pTag=$(this).parent().next(); 

		                 pTag.contents().unwrap().wrap( ' <textarea class="form-control mt-2" rows="3" id="updateComment"></textarea>' );
		                  
		                 $(this).contents().unwrap().wrap(" <button class='btn btn-primary' data-rno='"+rno+"'"+ " id='modifyReplySendBtn'></button>   ");
		                 
		                 check=false;
		                }
		                else{
		                  return;
		                }
		            	  
		            	  
		              });
		            
		                $(document).on("click","#modifyReplySendBtn",function(e){

		                  var rno=$(this).data("rno"); 
		                 
		                  
		                  var textTag=$(this).parent().next();
		                  
		                  var comment=textTag.val();
		            
		                 var reply={rno:rno,reply:comment};
		                 
		                 replyService.update(reply,function(result){
		                	
		                	 alert(result);
		                	 showList(pageNum);
		                 });
		                   
		                 //  textTag.contents().unwrap().wrap('<p></p>');  //되돌려놓기
		                 //$(this).contents().unwrap().wrap("  <button class='btn btn-outline-primary' data-rno='"+rno+"'"+" name='modifyReplyBtn'></button>") //되돌려놓기
		                 check=true;
		              
		                }); 
		                ////////////////// //////댓글 수정////////
			          
		                
		                var pageNum=1;												//첫번째로 pageNum은 1을 받고
		                
		                function showReplyPage(replyCnt){							//replyCnt는 showList실행시 전체 댓글 개수
		                	
		                	var endNum=Math.ceil(pageNum/10.0)*10;					// endNum은  ex pagenum이 1일때  10
		                	var startNum=endNum-9;									// startnum은 1
		                	
		                	var prev=startNum != 1;									// prev는 startNum이 1이 아닐때 생성
		                	var next=false;											//next는 디폴트로 폴스
		                	
		                	if(endNum * 10 >= replyCnt)							  // 만약  10 *10  =100  >= 76   
		                		{
		                			endNum=Math.ceil(replyCnt/10.0);			  // endNum= 8
		                		}
		                	
		                	if(endNum*10 < replyCnt)                            // 만약   10*10 =100  < 113 
		                		{
		                			next=true;									// next =true;
		                		}
		                	var str="";
		                	
		                	if(prev){			//현재 prev가 트루인가? 아니다
		                		str+="<li class='paginate_button previous'><a href='"+(startNum-1)+"' class='page-link'>prev</a></li>";
		                	}
		                	
		                	
		                	for(var i=startNum; i<=endNum ;i++)   //  1부터   <= endNum ( 10 ) 까지 
		                		{									
		                			str+="<li class='paginate_button'><a href='"+i+"' class='page-link'>"+i+"</a></li>"
		                		}
		                	
		                	if(next){  
		                		str+="<li class='paginate_button previous'><a href='"+(endNum+1)+"' class='page-link'>Next</a></li>";
		 		               
		                	}
		                	
		                	$(".pagination").html(str);
		                	
		                	
		                }
		                 
		                
		                
		                
		                $(".pagination").on("click",'a',function(e){
							
							e.preventDefault();
							 
							var num=$(this).attr("href");
						    pageNum=num;
						   showList(num);
							
						});
		                
		                
		                
		                
		                
			           
		          });  // End document.ready
		             
		            
		            
		            
		            
		            
		            
		            
		            /*
		            replyService.update({
		            	
		            	rno:41,
		            	bno:bnoValue,
		            	reply:"aaaaaa"
		            },function(result){
		            	alert("수정완료");
		            });
		            
					 
		            replyService.add( {reply:"JS TEST",replyer:"tester",bno:bnoValue},function(result){
		            	alert("RESULT :"+result);
		            });
		            
		            replyService.getList({bno:bnoValue,page:1},function(list){
		            	
		            	for( var i=0, len=list.length||0; i<len; i++){
		            		console.log(list[i]);
		            	}
		            });
		            
		            
		            replyService.remove(12,function(count){
		            	if(count === "success"){
		            		alert("REMOVED");
		            	}
		            },function(err){
		            	alert('ERROR....');
		            });
		            
		            */
		            
		            
		            
		            
		            
		 
		</script>



</html>


