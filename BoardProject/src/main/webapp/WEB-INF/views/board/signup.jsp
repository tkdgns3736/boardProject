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
<title>사용자 회원가입 페이지</title>
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
    height: 300px;
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
<script type="text/javascript">
/* 빈칸 검사 */
function test(){
if( sign.username.value == "" ) {
	sign.username.focus();
	alert("성명을 입력해 주십시오."); 
	return false; 
	}
if( sign.userid.value == "" ) {
	sign.userid.focus();
	alert("아이디를 입력해 주십시오."); 
	return false; 
	}
if( sign.userpw.value == "" ) {
	sign.userpw.focus();
	alert("비밀번호를 입력해 주십시오."); 
	return false; 
	}
if( sign.userpw_check.value == "" ) {
	sign.userpw_check.focus();
	alert("비밀번호 확인을 입력해 주십시오."); 
	return false; 
	}
}

function kakao_blank(){
	if( sign.name.value == "" ) {
		sign.name.focus();
		alert("회원이름을 입력해 주십시오."); 
		return false; 
		}
	if( sign.birth.value == "" ) {
		sign.birth.focus();
		alert("birth를 입력해 주십시오."); 
		return false; 
		}
	if( sign.phone.value == "" ) {
		sign.phone.focus();
		alert("phone를 입력해 주십시오."); 
		return false; 
		}
	
	}
function check_id(){
	 
	 var id = document.getElementById('userid').value;
	 var regExp = /^(?=.*[a-zA-z])(?=.*[0-9]).{8,16}$/;
	  //  var SC = ["!","@","#","$","%","*"];
	  //  var check_SC = 0;
	    
	    
	    if(id.search(/\s/) != -1) { 
	    	 document.getElementById('userid').value='';
		     document.getElementById('check1').innerHTML='아이디는 공백이 들어갈 수 없습니다.';
		     document.getElementById('check1').style.color='red';
		     return; // 함수종료     
	    }
	    
	    if(id.length < 8 || id.length>16){
	        document.getElementById('userid').value='';
	        document.getElementById('check1').innerHTML='비밀번호는 8글자 이상, 16글자 이하만 이용 가능합니다.';
	        document.getElementById('check1').style.color='red';
	        return; // 함수종료

	    }
	    /* 
	    if(id.length < 6 || id.length>16){
	        document.getElementById('userid').value='';
	        document.getElementById('check1').innerHTML='비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.';
	        document.getElementById('check1').style.color='red';
	        return; // 함수종료

	    }
	    	
	    
	     for(var i=0;i<SC.length;i++){
	        if(id.indexOf(SC[i]) != -1){
	            check_SC = 1;
	        }
	    }
	    
	    if(check_SC == 0){
	        document.getElementById('userid').value='';
	        document.getElementById('check1').innerHTML='!,@,#,$,%,* 의 특수문자가 들어가 있지 않습니다.';
	        document.getElementById('check1').style.color='red';
	        return; // 함수종료
	    }*/
	   if(!(regExp.test(id))){
	   document.getElementById('userid').value='';
       document.getElementById('check1').innerHTML='8 ~ 16자 영문, 숫자를 최소 한가지씩 조합해주세요';
       document.getElementById('check1').style.color='red';
       return;   
	    }
	    
	    
	    document.getElementById('check1').innerHTML='적합한 아이디입니다.';
        document.getElementById('check1').style.color='blue';
	    
    }
	
	
function check_pw(){
    var pw = document.getElementById('userpw').value;
    var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
    var SC = ["!","@","#","$","%","*"];
    var check_SC = 0;

    if(!(regExp.test(pw))){
 	    document.getElementById('userpw').value='';
        document.getElementById('check').innerHTML='8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합해주세요';
        document.getElementById('check').style.color='red';  
 	    }
    
    
    if(document.getElementById('userpw').value !='' && document.getElementById('userpw_check').value!=''){
        if(document.getElementById('userpw').value==document.getElementById('userpw_check').value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='blue';
        }
        else{
        	document.getElementById('userpw_check').value='';
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
        }
    }
}



/* 아이디 중복 체크 : ajax 비동기처리 */
function idCheck() {
	
    var userid = $("#userid").val();
    
    if(userid.search(/\s/) != -1) { 
        alert("아이디에는 공백이 들어갈 수 없습니다.");        
    } else {             
        if(userid.trim().length != 0) {
            $.ajax({
            	async : true,  //비동기방식
                type : 'POST', 
                data: userid,
                url: "id_check.do",
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function(res) {    
                    if(res==1) {
                        alert("해당 아이디 존재");    
                        $("#submit").attr("disabled", "disabled");
                    } else {
                        alert("사용가능 아이디");
                        $("#submit").removeAttr("disabled");
                    }            
                },
                error: function(error) {
                    alert("아이디를 입력해주세요.");
                }        
            });
        } else {
            alert("아이디를 입력해주세요.");
        }        
    }
}

$(document).ready(function(){ 
	
	$("#signup_btn").on('click',function(){ // 제출 버튼 이벤트 지정
		
		if(test()==false)
			return false;
		$.ajax({
			url:"signup.do", // 목적지
			type:"POST", // HTTP Method
			data:$("#signup").serialize(), // 전송 데이터
			dataType : 'json', // 전송 데이터 형식
				success:function(res){// 성공 시 실행
				if(res==0){
                alert("비밀번호가 다릅니다");
                //window.location.reload(true);
				}
				else if(res==1){
				alert("회원가입 성공");
				location = "user_login.do";
				
				}
				else if(res==2){
				alert("아이디가 이미 존재합니다");
				//window.location.reload(true);
					}
				else if(res==3){
					alert("본인인증이 필요합니다.");
				//window.location.reload(true);
						}
			},
			error:function(er){ //실패 시 실행
				alert("실패 원인 : " + er);
			}
		});
	});
});

function kakao_check(){
	
	if(kakao_blank()==false)
		return false;
	var popupWidth = 200;
	//팝업 넓이
	var popupHeight = 300;
	//높이
	var popupX = (window.outerWidth / 4) - (200 / 2);
	//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	var popupY= (window.outerHeight / 3) - (300 / 2);
	//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	window.open("", "kakao", " height=400, width=500, left="+ popupX + ", top="+ popupY);
	signup.target = "kakao";                    //form.target 이 부분이 빠지면 form값 전송이 되지 않습니다.
	signup.action = "kakao.do";                    //form.action 이 부분이 빠지면 action값을 찾지 못해서 제대로 된 팝업이 뜨질 않습니다.
	signup.method = "get";
	signup.submit();    
}
		
</script>

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
				<h2 style="display:inline;"><a href="signup.do">회원가입 페이지</a></h2><p style="display:inline;">&nbsp;&nbsp;&nbsp;회원가입 페이지입니다.</p>
			</div>
 <form id="signup" name="sign" >
      <div class="container">
    <div class="insert">
    
        <table>
    <tr>
        <td class="col1">아이디</td>
        <td class="col2">
            <input type="text" name="userid" id="userid" placeholder="아이디를 입력하세요." onchange="check_id()"><button type="button" onclick="idCheck()">아이디 중복확인</button><span>&nbsp;비밀번호는 8글자 이상, 16글자 이하만 이용 가능합니다.</span>
        </td>
    </tr>
     <tr>
        <td ></td>
        <td >&nbsp;<span id="check1"></span></td>
    </tr>
    <tr>
        <td class="col1">이름</td>
        <td class="col2"><input type="text" name="username" id="username" placeholder="이름을 입력하세요."></td>
    </tr>	
    <tr>
        <td class="col1">비밀번호</td>
        <td class="col2">
           <input  type="password" name="userpw" id="userpw" placeholder="비밀번호를 입력하세요."  onchange="check_pw()"><span>&nbsp;8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합해주세요.</span>
        </td>
    </tr>
    <tr>
        <td class="col1">비밀번호 확인</td>
        <td class="col2"><input  type="password" name="userpw_check" id="userpw_check" placeholder="다시한번 비밀번호를 입력하세요."  onchange="check_pw()"></td>
    </tr>
     <tr>
        <td ></td>
        <td >&nbsp;<span id="check"></span></td>
    </tr>
     <tr>
        <td class="col1">회원 이름</td>
        <td class="col2"><input type="text" name="name" id="name" placeholder="이름을 입력하세요.">
    </tr>
     <tr>
        <td class="col1">생년월일</td>
        <td class="col2"><input type="text" name="birth" id="birth" placeholder="생년월일을 입력하세요.">
    </tr>
     <tr>
        <td class="col1">전화번호</td>
       <td class="col2">
       <input type="text" name="phone" id="phone" placeholder="전화번호를 입력하세요.">
      	<input type="button" value="본인인증하기" onclick="kakao_check()">
      	</td>
    </tr>
    </table>
  </div>
 
  <div class="create">
    
        <input type="button" value="제출하기" id="signup_btn">
        <button type="button" onclick="location.href='user_login.do'">로그인 페이지</button>
    
  </div>
  </div>
  </form>
</div>
</body>
</html>