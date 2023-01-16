<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 페이지 이동설정 -->
<%@ taglib prefix="pageObject" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>내정보</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



<!-- 마우스 포인트 설정 -->
<style type="text/css">
.dataRow:hover {
	background: #ddd;
	cursor: pointer;
}
</style>
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
        
    .col1 {
    background-color: #e8e8e8;
    padding: 10px;
    text-align:	left;
    font-weight: bold;
    font-size: 0.8em;
    }
 
    .col2 {
    text-align: left;
    padding: 5px;
    }
 
    </style>
    
<!-- 조회수 증가를 위해 함수 생성 -->
<script type="text/javascript">
	$(function() {

		/* dataRow에 대한 함수 */
		$(".dataRow").click(
				function() {
					var no = $(this).find(".no").text();
					location = "view.do?no=" + no + "&inc=0"
							+ "&page=${pageObject.page}"
							+ "&perPageNum=${pageObject.perPageNum}"
							+ "&key=${pageObject.key}"
							+ "&word=${pageObject.word}"
							+ "&start_date=${pageObject.start_date}"
							+ "&end_date=${pageObject.end_date}"
							+ "&value=1";
				})
		
	})

	 function sort(id) {
		 var str = $('#date_check').serialize();
		 str+='&sort='+id
		 str ="page=${pageObject.page}"
			+ "&perPageNum=${pageObject.perPageNum}&" +str;
		 location = "list.do?"+str;
	
     }	
	 
		function user_check(){
			alert("로그아웃 완료")
			location ="user_logout.do";
		}
</script>
</head>
<body>


	<div class="container">
	
	<nav>
 		<ul>
            <li><a href="list.do">게시판</a></li>
            <li><a href="notice.do">공지사항</a></li>
			<li><a href="user_info.do">내정보</a></li>
            <li style="float: right;"><a href="list_admin.do">관리자 페이지 </a></li>
      
        </ul>
     </nav>   
    
     <div style="border: 1px solid #EAEAEA; padding: 10px; height: auto; min-height: 30px; overflow: auto ;">
				<h2 style="display:inline;"><a href="user_info.do">내정보</a></h2><p style="display:inline;">&nbsp;&nbsp;&nbsp;내정보 페이지입니다.</p>
		<form style="display:inline; float: right;">
				<p style="display:inline; text-align: right;">${user_name}님 환영합니다.</p>
		 		<input type="button" value="로그아웃" onclick="user_check()">
		 		</form>	
		 		
		</div>
			<div>
		 	<div class="user_info">
		 
		        <table>
		    <tr>
		        <td class="col1">아이디</td>
		        <td class="col2">${user_data.userid}</td>
		    </tr>
		    <tr>
		        <td class="col1">이름</td>
		        <td class="col2">${user_data.username}</td>
		    </tr>
		    <tr>
		        <td class="col1">가입일</td>
		        <td class="col2"><fmt:formatDate value="${user_data.user_date}"
								pattern="yyyy.MM.dd" /></td>
		    </tr>
		    </table>
		  </div>
		  
		
			<table class="table" >
			  	<tr>
		    	<td class="col1"><h4>내가 쓴 글</h4></td>
		    </tr>
				<tr class="jb-small">

					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:if test="${empty list }">
					<tr>
						<td colspan="5">데이터가 존재하지 않습니다.</td>
					</tr>
				</c:if>

				<c:if test="${empty list }">
					<!-- 데이터가 없는 경우 처리 -->
					<tr>
						<td colspan="5" class="text-center">데이터가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<!-- 데이터의 갯수 만큼 tr을 만든다. : 반복문 -> jsp jstl 사용 태그로 작성 -->
				<c:forEach items="${list}" var="vo">
					<tr class="dataRow" onmouseover="this.style.background='#EAEAEA'" onmouseout="this.style.background='white'"  Style="cursor:pointer;">
						<!-- 조회수 추가를 만들기 위해서 class no라는 함수를 클릭시 작동하게만듬 -->
						<td class="no">${vo.no}</td>
						<td>${vo.title}</td>
						<td>${vo.writer}</td>
						<td><fmt:formatDate value="${vo.writeDate}"
								pattern="yyyy.MM.dd" /></td>
						<td>${vo.hit}</td>
				</c:forEach>
				<tr>
					<td colspan="10" style="text-align: center"><pageObject:pageNav
							listURI="user_info.do" pageObject="${pageObject }" /></td>
				</tr>
			</table>
		</div>

	</div>
</body>
</html>