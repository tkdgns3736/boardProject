<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageObject" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="pageNav_notice" tagdir="/WEB-INF/tags"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 인증 정보</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" 
		integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" 
		crossorigin="anonymous" referrerpolicy="no-referrer" /> <!-- alert 기능 -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
		 integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" 
		 crossorigin="anonymous" referrerpolicy="no-referrer"> <!-- alert 기능 -->
		</script>
<script type="text/javascript">

function getParameterByName(name) {  			//get 방식이 아닌 url로 전달한 인자값을 받을때 필요한 함수.
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

window.onload = function() {
	var error = getParameterByName('error');
	  if(error =="error"){
		  alert("로그인 상태가 아닙니다. 로그인 후 다시 이용해주세요."); 
		  window.close();
	  }
	};


var res=null;
function test(){
	if( sign.username.value == "" ) {
		sign.username.focus();
		toastr.warning("성명을 입력해 주십시오.");
		return false; 
		}
	if( sign.birth.value == "" ) {
		sign.birth.focus();
		toastr.warning("생년월일을 입력하세요.");
		return false; 
		}
	if( sign.phone.value == "" ) {
		sign.phone.focus();
		toastr.warning("휴대푠 번호를 입력하세요.");
		return false; 
		}
	return true;
	}
$(document).ready(function(){ 
	
	$("#kakao_btn").on('click',function(){ // 제출 버튼 이벤트 지정
		
		if(test()==false)
			return false;
		
		var con = document.getElementById("kakao_btn");
		con.style.display = 'none'
		var con2 = document.getElementById("kakao_value_btn");
		con2.style.display = 'block'
		
		$.ajax({
			url:"kakao.do", // 목적지
			type:"POST", // HTTP Method
			data:$("#signup").serialize(), // 전송 데이터
			dataType : 'json', // 전송 데이터 형식
				success:function(data){// 성공 시 실행
					if(data.Msg =='0'){
					alert("고객 정보를 다시 확인하고, 입력 해주세요."); 
					window.location.reload(true);
					}
					if(data.Msg =='1'){
					alert("인증완료후 버튼을 눌러주세요."); 
					
					}
			},
			error:function(er){ //실패 시 실행
				alert("오류.다시 시도해주세요."); 
				 window.location.reload(true);
			}
		});
	});
});

$(document).ready(function(){ 
	
	$("#kakao_value_btn").on('click',function(){ // 제출 버튼 이벤트 지정
		
		$.ajax({
			url:"kakao_getVerify.do", // 목적지
			type:"POST", // HTTP Method
			data:{"??": "??"},//전송 데이터
			dataType : 'json', // 전송 데이터 형식
				success:function(res){// 성공 시 실행
					if(res==0){
					alert("카카오페이 인증 후 다시 눌러주세요"); 
					}
					if(res==1){
					alert("본인 인증 완료하였습니다"); 
					window.close();
					}
					
			},
			error:function(er){ //실패 시 실행
				alert("인증오류 입니다.다시 시도해주세요"); 
				window.close();
			}
		});
	});
});
</script>

</head>
<body>
<div class="container">
		<h1>본인 인증</h1>
 		<form id="signup" name="sign">   
        <table>
        
     <tr>
        <th>이름</th>
        <td><input type="text" name="username" id="username" value="${param.name}${param1.name}" readonly ></td>
    </tr>
    <tr>
        <th>생년월일(6자리)</th>
        <td><input type="text" name="birth" id="birth" value="${param.birth}${param1.birth}" readonly></td>
    </tr>

    <tr>
       <th>전화번호</th>
        <td><input  type="text" name="phone" id="phone" value="${param.phone}${param1.phone}" readonly></td>
    </tr>
    </table>
    
    	<div id="kakao_btn"  class="top_gragh" >
        <input Style=" float: right;"type="button" value="고객 정보 전송" id="kakao_btn" >
        </div>
        <div id="kakao_value_btn" style="display:none;" class="top_gragh">
   		 <input Style=" float: right;"	type="button" value="카카오 페이 인증 완료" id="kakao_value_btn">
		</div>
		
  </form>
</div>
</body>
</html>