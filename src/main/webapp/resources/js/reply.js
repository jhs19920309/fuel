


var replyService=(function(){

	function add(reply,callback,error){
		console.log("add reply......");
		
		
		$.ajax({
					type:'post',
					url:'/replies/new',
					data:JSON.stringify(reply),                        //서버로 전송할 데이터 지정  // Stringify=객체를 문자열 데이터로 가공하여 반환
																	   //JSON.stringify()함수는 Javascript값을 JSON문자열로 변환 한다. JSON.parse()함수는 JSON문자열을 객체로 변환 한다.
					//dataType										   //서버에서 받아올 데이터의 형식을 지정합니다,생략하면 요청한 자료에 맞게 자동설정
					contentType:"application/json; charset=utf-8",    //서버로 전송할 데이터의 content-type을 지정
																	  //JSON.stringify으로 데이터 보낼경우 처리 contentType을 application/json; charset=utf-8 형태로 변경하여야 함
					success:function(result,status,xhr){
						if(callback){
							callback(result);
						}
					},
					error:function(xhr,status,er){
						if(error){
							error(er);
						}
					}
		})	
	}
	
function remove(rno,callback,error){
		
		$.ajax({
					type:'delete',
					url:'/replies/'+rno,
					success:function(deleteResult,status,xhr){
						if(callback){
							callback(deleteResult);
						}
					},
					error: function(xhr,status,er){
						if(error){
							error(er);
						}
					}
		});
	}

 
	
	function getList(param,callback,error){
		
		var bno=param.bno;
		var page=param.page || 1;
		
		$.getJSON("/replies/pages/"+bno+"/"+page+".json",function(data){
			 
				if(callback){
					callback(data.replyCnt,data.list);
				
				}
	
			}).fail(function(xhr,status,err){
				if(error){
					error();
				}
			});
	}
	
	function update(reply,callback,error){
		
		$.ajax({
			
					type:'put',
					url:'/replies/'+reply.rno,
					data:JSON.stringify(reply),
					contentType:"application/json; charset=utf-8",
					success:function(result,status,xhr){
						if(callback){
							callback(result);
						}
					},
					error:function(xhr,status,er){
						if(error){
							error(er);
						}
					}
		});
	}
	
	function get(rno,callback,error){
		$.get("/replies/"+rno+".json",function(result){
			
			if(callback){
				callback(result);
			}
			
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	function displayTime(timeValue) {

		var today = new Date();

		var gap = today.getTime() - timeValue;

		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {

			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');

		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
	};
	
	return {add:add,
			getList:getList,
			remove:remove,
			update:update,
			get:get,
			displayTime:displayTime
	};
	
	
})();