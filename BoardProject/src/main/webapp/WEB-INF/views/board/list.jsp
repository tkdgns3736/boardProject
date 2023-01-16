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
<title>게시판 리스트</title>

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
    </style>
<!-- 조회수 증가를 위해 함수 생성 -->
<script type="text/javascript">
	$(function() {

		/* dataRow에 대한 함수 */
		$(".dataRow").click(
				function() {
					var no = $(this).find(".no").text();
					location = "view.do?no=" + no + "&inc=1"
							+ "&page=${pageObject.page}"
							+ "&perPageNum=${pageObject.perPageNum}"
							+ "&key=${pageObject.key}"
							+ "&word=${pageObject.word}"
							+ "&start_date=${pageObject.start_date}"
							+ "&end_date=${pageObject.end_date}"
							+ "&sort=${pageObject.sort}";
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

		function wirteVerify(){
			var popupWidth = 200;
			//팝업 넓이
			var popupHeight = 300;
			//높이
			var popupX = (window.outerWidth / 4) - (200 / 2);
			//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
			var popupY= (window.outerHeight / 3) - (300 / 2);
			//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
			window.open("write_request.do", "ee", " height=400, width=500, left="+ popupX + ", top="+ popupY);
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
				<h2 style="display:inline;"><a href="list.do">게시판</a></h2><p style="display:inline;">&nbsp;&nbsp;&nbsp;전체 게시판입니다.</p>
		<form style="display:inline; float: right;">
				<p style="display:inline; text-align: right;">${user_name}님 환영합니다.</p>
		 		<input type="button" value="로그아웃" onclick="user_check()">
		 		</form>

	</div>
		<form class="navbar-form"  id="date_check">
			<div class="form-group navbar-left">

				<select name="key" class="form-control">
					<option value="t" ${(pageObject.key =="t")? "selected":"" }>제목</option>
					<option value="c" ${(pageObject.key =="c")? "selected":"" }>내용</option>
					<option value="w" ${(pageObject.key =="w")? "selected":"" }>작성자</option>
					<option value="tc" ${(pageObject.key =="tc")? "selected":"" }>제목/작성자</option>
					<option value="tw" ${(pageObject.key =="tw")? "selected":"" }>내용/작성자</option>
					<option value="tcw" ${(pageObject.key =="tcw")? "selected":"" }>전체</option>

				</select> <input type="text" placeholder="Search" name="word"
					value="${pageObject.word}">
			</div>
			
			
			<div class="input-group-btn">
				<button class="btn btn-default" id="btn" type="submit">
					<i class="glyphicon glyphicon-search"></i>
				</button>
			</div>
			<div class="date_value">
				<!-- 날짜 pageobject에 넣어줘야함 -->
				<input type="date" name="start_date" value="${pageObject.start_date}">~<input type="date" name="end_date" value="${pageObject.end_date}">
			</div>
		</form>
		
		<div>
			<button type="button" onclick="wirteVerify()" 
				class="bnt bt-default" style="float: right;">글쓰기</button>
		</div>
		<div>
			<table class="table" >
				<tr class="jb-small">

					<th>글번호<button  id ="1u"  onclick="sort(this.id);" >&#129045;</button><button  id ="1d"  onclick="sort(this.id);" >&#129047;</button></th>
					<th>제목<button  id ="2u"  onclick="sort(this.id);">&#129045;</button><button  id ="2d"  onclick="sort(this.id);">&#129047;</button></th>
					<th>작성자<button  id ="3u"  onclick="sort(this.id);">&#129045;</button><button  id ="3d"  onclick="sort(this.id);">&#129047;</button></th>
					<th>작성일<button  id ="4u"  onclick="sort(this.id);">&#129045;</button><button  id ="4d"  onclick="sort(this.id);">&#129047;</button></th>
					<th>조회수<button  id ="5u"  onclick="sort(this.id);">&#129045;</button><button  id ="5d"  onclick="sort(this.id);">&#129047;</button></th>
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
							listURI="list.do" pageObject="${pageObject }" /></td>
				</tr>
			</table>

		</div>
	</div>
</body>
</html>