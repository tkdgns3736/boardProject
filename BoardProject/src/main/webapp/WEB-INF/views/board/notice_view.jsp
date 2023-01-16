<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 세부 글보기</title>

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
	$(function() {
		/* // 게시판 글삭제의 이벤트처리
		$("#deleteBtn").click(function(){
			$("#pwDiv").show();
			// href="" -> 자신을 다시 호출한다. => false : 호출하는 것을 무시
			return false;
		}); */
		// 게시판 글삭제 취소 이벤트처리
		$("#delete_cancel_Btn").click(function() {
			$("#pwDiv").hide();
			// href="" -> 자신을 다시 호출한다. => false : 호출하는 것을 무시
			return false;
		});
	});
</script>
</head>
<body>
	<!-- 데이터 표시하는 부분 : Bootstrap 쉽게 표시 : 라이브러리 필요 -> sitemesh에서 처리 -->
	<div class="container">
		<!-- 제목 -->
		<h2>
			<a href="notice.do">공지사항</a>
		</h2>
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
				<td align="left"><a href="FileDownload2.do?file_name=${vo.file_name }">${vo.file_name }</a></td>
				</c:if>
			</tr>
			<tr>
				<td colspan="2"><a
					href="notice.do?page=${param.page}&perPageNum=${param.perPageNum}&word=${param.word}&start_date=${param.start_date}&end_date=${param.end_date}" class="btn btn-default">리스트</a></td>
			</tr>
		</table>
	</div>

</body>
</html>