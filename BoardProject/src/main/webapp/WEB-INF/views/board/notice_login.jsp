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
<title>관리자 로그인 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
div.input-group-btn {
	display: contents;
}

form.navbar-form {
	padding: 10px 1px;
}
</style>
<style>
.jb-xx-small { font-size: xx-small; }
.jb-x-small { font-size: x-small; }
.jb-small { font-size: small; }
.jb-medium { font-size: medium; }
.jb-large { font-size: large; }
.jb-x-large { font-size: x-large; }
.jb-xx-large { font-size: xx-large; }
</style>
 <style>
        @import url(https://fonts.googleapis.com/css?family=Roboto:400,700,500);

        /* main Styles */

        nav { background: #2ba0db; }

        nav ul {
            font-size: 0;
            margin: 0;
            padding: 0;
        }

        nav ul li {
            display: inline-block;
            position: relative;
        }

        nav ul li a {
            color: #fff;
            display: block;
            font-size: 14px;
            padding: 15px 14px;
            transition: 0.3s linear;
        }
    </style>
   	
 <script>
 //로그인 비동기 확인 코드
		$(document).ready(function(){ 
			
			$("#login_btn").on('click',function(){ // 제출 버튼 이벤트 지정
				
				$.ajax({
					url:"notice_login.do", // 목적지
					type:"POST", // HTTP Method
					data:$("#login_check").serialize(), // 전송 데이터
					dataType : 'json', // 전송 데이터 형식
						success:function(res){// 성공 시 실행
						if(res==0){
                        alert("로그인 실패");
                        window.location.reload(true);
						}
						else if(res==1){
						alert("로그인 성공");
						location = "notice_admin.do";
						
						}
						else if(res==2){
						alert("비밀번호가 틀렸습니다.");
						window.location.reload(true);
						}
					},
					error:function(er){ //실패 시 실행
						alert("실패 원인 : " + er);
					}
				});
			});
		});
	</script>
</head>
</head>
<body>
	<div class="container" style="background-color: #EAEAEA;">

		<nav>
			<ul>
				<li><a href="list.do">게시판</a></li>
				<li><a href="notice.do">공지사항</a></li>
			
			</ul>
		</nav>
			<div style="border: 1px solid #EAEAEA; padding: 10px; height: auto; min-height: 30px; overflow: auto ;">
				<h2 style="display:inline;"><a href="notice_login.do">관리자 로그인</a></h2><p style="display:inline;">&nbsp;&nbsp;&nbsp;관리자 로그인 페이지입니다.</p>
			</div>
			
			
			<div>
			  <form id ="login_check">
           <div>
                <label>아이디</label>
                <input id="userid" name="userid">    
           </div>
           <div>
                <label>비밀번호</label>
                <input id="userpw" name="userpw" type="password">
           </div>
            <input type="button" value="로그인" id="login_btn">   
        </form>
        </div>
        
	</div>
</body>
</html>