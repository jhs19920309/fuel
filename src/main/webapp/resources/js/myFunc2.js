 
  
  /////////////////////////////////////////////////////////////   문서 모두 로딩 된다음  전국 시도별 평균 가격 설정  디폴트로 서울로 설정
  $(document).ready(function(){
  
	  
	  setCityAvgPrice("01");
	   
	 
	  	setMap("광주 서구 천변좌하로 160 (치평동)");                    // 지도 디폴트 위치 설정 
	 	  
 });
/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
  
  $("#top10Search").on("click",function(){
	   
	  var addrObj=null;
		
	    var  area=$("#Top10Sido option:selected").val();
		var local=$("#underselect option:selected").val();     
		var prodcd=$('#oilselect').find(":selected").val();
	 
		if(area==local || local=="")
	    	{   
	    		 
	    		   
	    		 addrObj=setlowTop10(area,prodcd);
				 top10GetLocation(addrObj);
			 		 
	    	}
		else 
			{
			 
			 addrObj=setlowTop10(local,prodcd);
			 
				top10GetLocation(addrObj);
			}
 
  });
  
  $("#aroundSearch").on("click",function(){
	 
	  aroundGetLocation();
	  
  }); 
  
////////////////////////////////////////////////////  
  
	/*  전국 시도별 평균 가격 select 변할때 동작하는 함수*/
	$("#selectcity").on("change",function(){         
		
	var condition=$("#selectcity option:selected").val();
	 
	setCityAvgPrice(condition);
	
	});
	
/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/ 	
	
	/* 전국 시도별 평균 가격 값 넣는 함수*/
	function setCityAvgPrice(num){                           //  처음 $(document).ready에서 서울로 기본값 세팅됨
 		
		getCityAvgPrice(num,function(data){
	 
			$("#selectcityB027").text(data["B027"]);
			
			$("#selectcityB034").text(data["B034"]);
			
			$("#selectcityD047").text(data["D047"]);
			
			$("#selectcityK015").text(data["K015"]);
		 
		});
	}
	//////////////////////////////////////////////////////////

	/*전국 시도별 평균 가격 값 가져오는 함수*/
	function getCityAvgPrice(param,callback,error)
	{
		var citycode=param;
		 
		$.getJSON("/getAvgCityPrice/"+citycode+".json",function(data){
			
			if(callback)                                                                             
				{
					callback(data);
				}
			
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	/////////////////////////////////////////////////////////
	

	  /////////////////////////////////////////////////////////////////
	  $("#Top10Sido").on("change",function(){                                    // Top10 도시 세팅중 대도시 클릭 완료후 로컬 셀렉트 옵션값 넣는 함수.
			
		  var area1=$("#Top10Sido option:selected").val();	// value 값
		  var area2=$("#Top10Sido option:selected").text();  //텍스트값
		  
		  if(area1=="00")
			  {
			     $("select#underselect option").remove();
			     $("#underselect").html("<option value=''>--</option>");
			  }
		  else
			  {
			  	 setLocalSelectOptions(area1,area2);
			  }
		  
	  });
	   
	  function setLocalSelectOptions(num,bigname){
			
		  var into="<option value='"+num+"'>"+bigname+" 전체"+"</option>";
		
			var select=$("#underselect");
			
			getList(num,function(data){
				
				$.each(data, function(idx, val) {                                  
					//여기서는 인덱스 값 호출하면 도봉구 이런거나옴 만약 ajax로 받은게 배열이먄 인덱스로 0,1,2,3나올듯
					
					into=into+"<option value='"+data[idx]+"'>"+idx+"</option>";
					
					 
				});
				
				select.html(into); 
			});
		}
	  
	  
	  
	  function getList(param,callback,error)
		{
			var num=param;
			
			$.getJSON("/sm/"+num+".json",function(data){
				
				if(callback)
					{
						callback(data);
					}
			}).fail(function(xhr,status,err){
				if(error){
					error();
				}
			});

		}
	   
	  /*--------------------------------------------------------------*/
	  

	  function getlowTop10(param,callback,error)
	  {
	  
		  var area=param.area;
	  	var prodcd=param.prodcd;
	  	
	  	
	  	var request="/getTop10/"+prodcd+"/"+area+".json";
	 
	  	$.ajaxSetup({
	         async: false
	     });

	  	$.getJSON(request,function(data){
	  		if(callback)
	  			{
	  				callback(data);
	  			}
	  		
	  	}).fail(function(xhr,status,err){
	  		if(error){
	  			error();
	  		}
	  	});
	  }
/////////////////////////////////////////////////////////////   TOP10 주유소 찾기 함수     
		function setlowTop10(area,prodcd){
			  var arrAddr_van=new Array();  //배열 생성 거리생성위한 주소 미리저장
			  var arrAddr_new=new Array();
			 
				getlowTop10({area:area,prodcd:prodcd},function(data){
	  		
	  			$.each(data,function(idx)
	  			{  
	  				var id="#top";
	  				var tempidx=idx+1;
	  				 var tempid=id+(tempidx);
	  				                                              
	  				var temp="<th scope='row'>"+tempidx+"</th>"+"<td>"+data[idx].new_ADR+"</td>"+"<td>"+data[idx].os_NM+"</td>"+"<td style='color:orangered;' align='center'>"+data[idx].price+"</td>"
	  						+"<td ><button class='btn btn-primary' type='button' id='mapbtn' name='"+data[idx].uni_ID+"'>"+ "지도</button></td>"+"<td id='distance"+tempidx+"'>"+"</td>";			  				 
	  																							
	  			 	 $(tempid).html(temp);		 
	  			  
	  				arrAddr_van[idx]=data[idx].van_ADR   // 배열안에 거리구하기 위한 주소 미리 넣어놓기
	  				arrAddr_new[idx]=data[idx].new_ADR
	  				 
	  		
	  			});
	  			  
	  		});
				return {"van_addr":arrAddr_van,"new_addr":arrAddr_new};
	  	  	}
/////////////////////////////////////////////////////////////
		

/////////////////////////////////////////////////////////////	  지도 보기 클릭시 지도 위치로 스크롤 내리기.	
	    function fnMove(seq){
	        var offset = $("#div" + seq).offset();
	        $('html, body').animate({scrollTop : offset.top}, 400);
	    }
/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */		 
		
	    function top10GetLocation(addrObj) {
	    	  if (navigator.geolocation) { // GPS를 지원하면
			    navigator.geolocation.getCurrentPosition(function(position) {
			      
			     var latitude=position.coords.latitude;      // 위도  좌표를 저장한다.
			      var longitude=position.coords.longitude;	 // 경도 좌표를 저장한다.
			      
			      setDistance(latitude,longitude,addrObj); 			//테이블 안에 거리 계산 나옴 TOP10 말하는거임
			  	 	      
			    }, function(error) {
			      console.error(error);
			    }, {
			      enableHighAccuracy: true,
			      maximumAge: 0,
			      timeout: Infinity
			    });
			    
			  } else {
			    alert('GPS를 지원하지 않습니다');
			  }	  
			}
	    
	    
	    
	    
	    
	    function getcoordinate(param,callback,error)
		{
			var addr_van=param.van_addr;
			var addr_new=param.new_addr;
			
			var request="/getDistance/"+addr_van+"/"+addr_new+".json";
			$.ajaxSetup({
		         async: false
		     });
			$.getJSON(request,function(data){
				if(callback)
					{
						callback(data);
					}
				
			}).fail(function(xhr,status,err){
				if(error){
					error();
				}
			});
		}

	    function setDistance(latitude,longitude,addrObj)
		{
	    	var arrAddr_van=addrObj.van_addr;
	    	var arrAddr_new=addrObj.new_addr;
	    	
			for(i=0;i<10;i++)
				{
						
						var van_addr=arrAddr_van[i];
						var new_addr=arrAddr_new[i];
						
				         var distance=getTheDistance(latitude,longitude,van_addr,new_addr);			
				         var idCnt=i+1;
		    			 
				         var id="#distance"+idCnt; 						 
		    				
		    			 $(id).text(distance);
				} 
		}
	    
		function getTheDistance(latitude,longitude,van_addr,new_addr){      //현재 내 좌표 a,d랑 목적지 주소
				
				var van_addr=van_addr;       
				var new_addr=new_addr;
				var distance;
				
				getcoordinate({"van_addr":van_addr,"new_addr":new_addr},function(data){    //배열안에 주소 하나씩 KAKAOAPI에 넘겨서 좌표 얻어와서 x,y에 넣음 
					 
					var x=data.y;
					var y=data.x;
					
					if(x=="No")
						{
							distance="좌표 오류"; 
						}
					
					else{
					
					 var temp=new daum.maps.LatLng(longitude ,latitude)  
				     var temp2=new daum.maps.LatLng(y,x)  

				     
				     var clickLine  = new daum.maps.Polyline({ 
				        	path: [temp] // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다     //  path: [clickPosition]  원래 이거
				        });				    
				       var path = clickLine.getPath();
				   
				       
				       
				        path.push(temp2);
				        clickLine.setPath(path);
				       
				        distance =Math.round(clickLine.getLength());
				         
				        distance=lengthConversion(distance);
					}
				         
				    				 
				});
				return distance;
		        
				
		} 

	    
		 
		 
 
		/////////////////////////////////////////////////////////////////////////////////////////////////////// (위치 설정) 버튼 누르면 가장먼저 실행 되는 func 
	 
		 
		 
		function aroundGetLocation() {
			  if (navigator.geolocation) { // GPS를 지원하면
			    navigator.geolocation.getCurrentPosition(function(position) {
			      
			     var latitude=position.coords.latitude;      // 위도  좌표를 저장한다.
			      var longitude=position.coords.longitude;	 // 경도 좌표를 저장한다.
			        
			      var obj=wgs84ToKatech(latitude,longitude);   // 변환해서 받은 p.x 랑 p.y를 내 근처 주유소 뿌려주는 func에 던지기.
			      												//위도 경도를 opinet api에 넘길 수 있는 카텍좌표계로 변환해주는 함수
			      
			      var prodcd=$("#prodcd").val();
			      var distance=$("#distance").val();
			      var sort=$("#sort").val();
			      
			      if(prodcd!=null && distance!=null && sort!=null )
			      {
			      setAroundAll(obj);      //내 근처 주유소 테이블 세팅하는 펑션
			      }
			      else{
			    	  alert("거리,종류,정렬 방법을 모두 선택해주세요");
			    	  return;
			      }
			      
			    }, function(error) {
			      console.error(error);
			    }, {
			      enableHighAccuracy: true,
			      maximumAge: 0,
			      timeout: Infinity
			    });
			    
			  } else {
			    alert('GPS를 지원하지 않습니다');
			  }	  
		}
		
		
/////////////////////////////////////////////////////////////      지도 버튼을 눌렀을 경우 세부정보 세팅  +주유소 아이디값 넘김
		$(document).on("click","#mapbtn",function(event){
		
			var id=$(this).attr("name");
			 setDetails(id);
		 	 fnMove('1')
		 });
/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/		
  
		
		
/////////////////////////////////////////////////////////////////////////      지도 위치 설정하기 setDetails 함수 안에서 옆에 세부정보 주소 가져와서 실행됨	 
		
	 
		function setMap(addr){

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};  
		
		
		//지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 
	
		 
		
		
		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder()
		
		
		//주소로 좌표를 검색합니다
		geocoder.addressSearch(addr , function(result, status) {

		 // 정상적으로 검색이 완료됐으면 
		  if (status === daum.maps.services.Status.OK) {

		     var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		     // 결과값으로 받은 위치를 마커로 표시합니다
		     var marker = new daum.maps.Marker({
		         map: map,
		         position: coords
		     });
		     // 인포윈도우로 장소에 대한 설명을 표시합니다
		     var infowindow = new daum.maps.InfoWindow({
		         content: '<div style="width:150px;text-align:center;padding:6px 0;">위치</div>'
		     });
		     infowindow.open(map, marker);
		     // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		     map.setCenter(coords);
		 } 
		});    
		function setZoomable(zoomable) {
		    map.setZoomable(zoomable);    
		}
		
		setZoomable(false);
		 
	}
		 
		
		function getDetails(param,callback,error)
		{
			var id=param;
			
			var request="/getDetails/"+id+".json";
			
			$.getJSON(request,function(data){
				if(callback)
					{
						callback(data);
					}
				
			}).fail(function(xhr,status,err){
				if(error){
					error();
				}
			});
		}
		
		function setDetails(id){
			
				getDetails(id,function(data){
					
					$("#van_adr").text(data.van_ADR);
					$("#poll_div_cd").text(data.poll_DIV_CD);
					$("#os_nm").text(data.os_NM);
					$("#new_adr").text(data.new_ADR);
					$("#tel").text(data.tel);
					$("#lpg_yn").text(data.lpg_YN);
					$("#maint_yn").text(data.maint_YN);
					$("#car_wash_yn").text(data.car_WASH_YN);
					$("#kpetro_yn").text(data.kpetro_YN);
					$("#cvs_yn").text(data.cvs_YN);
					
					if((data.b027_PRICE))
						{
							$("#detailB027Price").text(data.b027_PRICE);
						}
					 if((data.b034_PRICE))
					{
						$("#detailB034Price").text(data.b034_PRICE);
					}
					
					 if((data.d047_PRICE))
					{
						$("#detailD047Price").text(data.d047_PRICE);
					}
					 if((data.k015_PRICE))
					{
						$("#detailK015Price").text(data.k015_PRICE);
					}
					 
					 setMap(data.new_ADR);
					 
				});
		}
		
		 
		    
			function wgs84ToKatech(x,y){
		    Proj4js.reportError = function(msg) { alert(msg); }
		    Proj4js.defs['WGS84경위도'] = '+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs';
		    Proj4js.defs['KATEC'] = 
		        '+proj=tmerc +lat_0=38 +lon_0=128 +ellps=bessel ' + 
		        '+x_0=400000 +y_0=600000 +k=0.9999 +towgs84=-146.43,507.89,681.46 ' + 
		        '+units=m +no_defs';
		     
		    var wgs84 = new Proj4js.Proj('WGS84경위도');
		    var katec = new Proj4js.Proj('KATEC');
		 
		    var p = new Proj4js.Point(y,x);
		    Proj4js.transform(wgs84, katec, p); 
		    //alert(p.x + " " + p.y);
		    
		    var obj=new Object();
		    obj.x=p.x;
		    obj.y=p.y;
		    return obj;
		    
			}
			
			var globaldata; //API로 부터 받아온 Data
			
			function setAroundTable(first){
				// console.log("위 "+first);
				
					
					if(($("#AroundAlltable").children().length)!=0)
						{
							$("#AroundAlltable").empty();
						}
					
				  var list=globaldata;             //API로 부터 받아온 Data
				  var realEnd=globaldata.length;
				  
				  var start=first;
			 
				  var last=start+5;
				  if(last>realEnd)
					  {
					  	last=realEnd;
					  }
				   
					var strr="";
				//	console.log("아래   "+start);
				//	console.log("그 아래 "+last);
					for( start ; start<last ; start++)
				    	{
							var distance=lengthConversion(list[start].distance);
						    
				    		strr=strr+"<tr><th scope='row'>"+(start+1)+"</th>"
				    				  +"<td>"+list[start].os_nm+"</td>"
				    				  +"<td align='center'>"+list[start].price+"</td>"
				    				  +"<td>"+distance + "</td>"
				    				  +"<td><button class='btn btn-primary' type='button' id='mapbtn' name='"+list[start].uni_id+"'>"+"지도</button></td>";
				    				  +"</tr>";
				    	}
			 				 
				    $("#AroundAlltable").append(strr);
			}
			
			 
			function setAroundAll(obj)   //   x,y 범위( 종류  가격순 거리순)   5개 받아야함
			{ 
				
				var x=obj.x;
				var y=obj.y;
			    var distance=$("#distance option:selected").val();		
				var prodcd=$("#prodcd option:selected").val();
			    var sort=$("#sort option:selected").val();
			    
			    
			
			    getAroundAll( {x:x,y:y,distance:distance,prodcd:prodcd,sort:sort} ,function(data){
			    	 
			    	globaldata=data;
			    	 
			        var TotalPageNum=Math.ceil( (data.length)/5 ); //만약 사이즈가 56이면 11.2고 12가 값이된다 //총 페이지수
				    //alert(data.length);
			        setPageNumber(TotalPageNum);	    
				
			        setAroundTable(0); 
			    }); 
			}
			
			
			 
			
			function getAroundAll(param,callback,error)
			{
				
				var x=param.x;
				var y=param.y;
				var distance=param.distance;
				var prodcd=param.prodcd;
				var sort=param.sort;
				
				
				
				var request="/getAroundAll/"+x+"/"+y+"/"+distance+"/"+prodcd+"/"+sort+".json";
				
				$.getJSON(request,function(data){
					 
					if(callback)
						{  
							callback(data);
						}
					
				}).fail(function(xhr,status,err){
					if(error){
						error();
					}
				});
			}
 
		 
			
			function setPageNumber(TotalPageNum){
				
				$(".pagination *").remove();
				   var str="";
				   
				   var start=1;
				   var go=0;
		    for(start;start<TotalPageNum+1;start++)
		    	{ 
		    	//페이지 개수만큼 페이지 넘버링 생성하기
		    		 str=str+"<li name='pageli' class='paginate_button page-item'><a href='#' class='page-link' id='"+(go)+"'>"+start+"</a></li>";
		    		  go=go+5;
		    		}
		    
		     $(".pagination").append(str);
		    
			}
		
		
			$(document).on("click",".page-link",function(event){
				
			  var start=$(this).attr("id");
			  var start=parseInt(start);  
			  setAroundTable(start);
				
			});
			
			
			function getIdByAddress(param,callback,error)
	    	{
	    		var addr=param;
	    		 
	    		$.getJSON("/getIdByAddress/"+addr+".json",function(data){
	     
	    			if(callback)
	    				{
	    					callback(data);
	    				}
	    			
	    		}).fail(function(xhr,status,err){
	    			if(error){
	    				error();
	    			}
	    		});
	    	}
			
		    $("#FindRoad").on("click",function(){
		    	
		    	var addr=$("#van_adr").text();
		    	
		    	var id=getIdByAddress(addr,function(data){
		     
		    		var openmap="http://map.daum.net/link/to/"+data;
		    		window.open(openmap, 'newWindow');
		    	});
		    	 
		    });
		    
		    var lengthConversion = function(length){

			    var distance=parseInt(length);
	            
	            
	            
	          if(distance >= 1000){
	        	  
	           distance = distance / 1000;
	           var length=distance.toFixed(3);
	           length=length+" km";
	           return length;

	            }
	            else{
	                distance=distance+" m"
	                return distance;
	            }

	               

	          }
			
			
			 