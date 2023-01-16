<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 팝업</title>

<!-- Bootstrap 라이브러리 등록 : CND 방식 -> 인터넷이 되어야 한다. -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
#pwDiv {
	display: none;
}
</style>
<script type="text/javascript">

function setCookie(name, value, expiredays) {
var today = new Date();
    today.setDate(today.getDate() + expiredays);

    document.cookie = name + '=' + escape(value) + '; path=/; expires=' + today.toGMTString() + ';'
}

function closePop() {       
if(document.forms[0].todayPop.checked)               
setCookie('pop_'+${vo.no }, '${vo.no }', 1);
self.close();
}
</script>

</head>
<body>
	<!-- 데이터 표시하는 부분 : Bootstrap 쉽게 표시 : 라이브러리 필요 -> sitemesh에서 처리 -->
	<div class="container">	
		<!-- 제목 -->
		<h1>공지사항</h1>
		<!-- 데이터 테이블 -->
		<!-- bootstrap 적용 : w3schools.com 참조
		: 1. 라이브러리 등록 , 2.body안에 container 3. 그외필요한 객체 => tag 안에 class -->
		<table class="table">
			<tr>
				<th>글번호</th>
				<!-- vo안에 no property를 사용했다. => getNo()를 사용한 것 -->
				<td>${vo.no }</td>
			</tr>
			<tr>
				<th>제목</th>
				<!-- vo안에 no property를 사용했다. => getTitle()를 사용한 것 -->
				<td>${vo.title }</td>
			</tr>
			<tr>
				<th>글내용</th>
				<!-- vo안에 no property를 사용했다. => getContent()를 사용한 것
				출력만 하면 HTML에서 줄바꿈을 무시한다. => pre tag사용 -->
				<td><pre style="background: #fff; border: none; font-size: 11pt">${vo.content }</pre></td>
			</tr>
			<tr>
				<th>작성자</th>
				<!-- vo안에 no property를 사용했다. => getWriter()를 사용한 것 -->
				<td>${vo.writer }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<!-- vo안에 no property를 사용했다. => getWriteDate()를 사용한 것 -->
				<td><fmt:formatDate value="${vo.writeDate }"
						pattern="yyyy.MM.dd" /></td>
			</tr>
			<tr>
				<th>조회수</th>
				<!-- vo안에 no property를 사용했다. => getHit()를 사용한 것 -->
				<td>${vo.hit }</td>
			</tr>
			<tr>
				<c:if test="${vo.file_name ne null}">
				<th bgcolor="orange">첨부파일</th>
				<td align="left"><a href="FileDownload.do?file_name=${vo.file_name }">${vo.file_name }</a></td>
				</c:if>
			</tr>
		<!-- 	<tr>
				<th>비밀번호 확인</th>
				vo안에 no property를 사용했다. => getHit()를 사용한 것
				<td><input type="text"  name="pw_check" type="password"></td>
			</tr>
				 -->
		</table>
				<form>
		<input type="checkbox" name="todayPop" onClick="closePop()">
		오늘 하루 그만보기
		</form>
				
	</div>

</body>
</html>