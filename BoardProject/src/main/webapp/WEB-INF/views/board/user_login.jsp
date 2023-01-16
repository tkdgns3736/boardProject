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
<title>사용자 로그인 페이지</title>
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
   		<style>
   	    div.container{
    }
 
      div.insert{
    }
 
    div.create{
    width: 800px;
    text-align: center;
    padding: 30px;
    border-bottom: 1px solid black;
    margin: auto;
    }
 
    table{
    height: 150px;
    width: 900px;
    border-top: 3px solid black;
    margin-right: auto;
    margin-left: auto;
    }
 
    td{
    border-bottom: 1px dotted black;
    }
 
    caption{
    text-align: left;
    }
 
    .col1 {
    background-color: #e8e8e8;
    padding: 10px;
    text-align: right;
    font-weight: bold;
    font-size: 0.8em;
    }
 
    .col2 {
    text-align: left;
    padding: 5px;
    }
 
    .but1 {
    height: 25px;
    width: 80px;
    color: white;
    background-color: black;
    border-color: black;
    }
 
    .but2 {
    height: 27px;
    width: 120px;
    color: white;
    background-color: black;
    border-color: black;
    }
 
    .but3 {
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    }
 
    .but4{
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    }
    
    .but1:hover {
    background-color: #b9b9b9;
    color: black;
    border: 2px solid black;
    }
 
    .but2:hover {
    background-color: #b9b9b9;
    color: black;
    border: 2px solid black;
    }
 
    .but3:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
 
    .but4:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
    
    p{
    font-size: 0.7em;
    }
 
    .g{
    font-size: 0.7em;
    }
 
    .c{
    font-size: 0.7em;
    }
 
    .a{
    font-size: 0.7em;
    }
    
    .num{
    color: red;
    }
 
  </style>
 <script>
 //로그인 비동기 확인 코드
		$(document).ready(function(){ 
			
			$("#login_btn").on('click',function(){ // 제출 버튼 이벤트 지정
				
				$.ajax({
					url:"user_login.do", // 목적지
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
						location = "list.do";
						
						}
						else if(res==2){
						alert("로그인 실패.");
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
				  <li><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="list_admin.do">관리자 페이지 </a></li>
			</ul>
		</nav>
			<div style="border: 1px solid #EAEAEA; padding: 10px; height: auto; min-height: 30px; overflow: auto ;">
				<h2 style="display:inline;"><a href="user_login.do">사용자 로그인</a></h2><p style="display:inline;">&nbsp;&nbsp;&nbsp;사용자 로그인 페이지입니다.</p>
			
			
	<form id ="login_check">
	<div class="container">
    <div class="insert">
     <table>
     <tr>
         <td class="col1">아이디</td>
          <td class="col2"><input id="userid" name="userid"></td>
			</tr>   
  

  			<tr>
        <td class="col1">비밀번호</td>
  		<td class="col2"><input id="userpw" name="userpw" type="password"></td>
           </tr>
    	</table>
  		 </div>
  	<div class="create">
            <input type="button" value="로그인" id="login_btn"> 
             <input type='button'  onclick="location.href='signup.do'" value='회원가입' /> 
	</div>
	</div>
	
        </form>
	</div>
        
        
	</div>
</body>
</html>