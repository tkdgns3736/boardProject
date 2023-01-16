<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글수정</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  
  /* 버튼 작동 함수 */
  $(function(){
	  $(".cancelBtn").click(function(){
		history.back();
	  })
	  
	  
  })
  </script>
</head>
<body>
<div class="container">
<h2><a href="list.do">게시판 수정</a></h2>
<form method ="post" class="form-group"  enctype="multipart/form-data">
<table class="table">
	<tr>
			<th>제목</th>
			<td><input class="form-control" name="title" value=" ${vo.title }"></td>
	</tr>
	<tr>		
			<th>내용</th>
			<td><input class="form-control" name="content" value="${vo.content }"></td>
	</tr>
	<tr>
			<th>작성자</th>
				<!-- vo안에 no property를 사용했다. => getWriter()를 사용한 것 -->
			<td>${vo.writer }</td>
			</tr>
			<tr>
				<c:if test="${vo.file_name ne null}">
				<th bgcolor="orange">첨부파일</th>
				<td align="left"><a href="FileDownload.do?file_name=${vo.file_name }">${vo.file_name }</a></td>
				</c:if>
			</tr>

			<tr>
					<td colspan="2">
					<input type="file" name="uploadFile"/>
						<button>등록</button>
						<button type="reset">새로입력</button>
						<button type="button" class="cancelBtn">취소</button>
						</td></tr>

				
</table>
</form>
</div>
</body>
</html>