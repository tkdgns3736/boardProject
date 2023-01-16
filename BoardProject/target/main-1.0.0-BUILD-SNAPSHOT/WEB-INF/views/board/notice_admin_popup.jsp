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
<title>공지사항 팝업 페이지</title>
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
    <script type="text/javascript">
	$(function() {

		/* dataRow에 대한 함수 */
		$(".dataRow").click(
				function() {
					var no = $(this).find(".no").text();
					location = "notice_admin_view.do?no=" + no + "&inc=0" //관리자가 보는것은 조회수 증가 안하기 위해 0넣음
							+ "&page=${pageObject.page}"
							+ "&perPageNum=${pageObject.perPageNum}"
							+ "&word=${pageObject.word}"
							+ "&start_date=${pageObject.start_date}"
							+ "&end_date=${pageObject.end_date}"
							;
				})
		
	})
	
	function admin_check(){
		alert("로그아웃 완료")
		location ="notice_logout.do";
	}
	
	$(document).ready(function() {
		//최상단 체크박스 클릭
		$("#checkall").click(function() {
			//클릭되었으면
			if ($("#checkall").prop("checked")) {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
				$("input[name=chk]").prop("checked", true);
				//클릭이 안되있으면
			} else {
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
				$("input[name=chk]").prop("checked", false);
			}
		})
	})
	
	function notice_delete() {
		var chk_arr = [];
		$("input[name=chk]:checked").each(function() {
			var chk = $(this).val();
			chk_arr.push(chk);
		})
		var txt;

		var r = confirm("삭제하시겠습니까?");
		if (r == true) {
			txt = "삭제";

			$.ajax({
				type : "POST",
				url : "popup_delete.do",
				data : "value=" + chk_arr,
				success : function(data) {
					alert("삭제 성공")
					window.location.reload(true);
				},

				error : function() {
					alert("삭제 에러")
				}
			});

		} else {
			txt = "취소!";
		}
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
				<li><a href="list_admin.do">게시판 관리 </a></li>
				<li><a href="notice_admin.do">공지사항 관리 </a></li>
				<li><a href="notice_admin_popup.do">팝업 관리 </a></li>
				<li><a href="user_controller.do">회원 관리</a></li>
				
			</ul>
		</nav>
			
			<div style="border: 1px solid #EAEAEA; padding: 10px; height: auto; min-height: 30px; overflow: auto ;">
				<h2 style="display:inline;"><a href="notice_admin_popup.do">팝업 관리</a></h2><p style="display:inline;">&nbsp;&nbsp;&nbsp;팝업 관리 페이지.</p>
				
				<form style="display:inline; float: right;">
				<p style="display:inline; text-align: right;">${admin_name}님 관리중</p>
		 		<input type="button" value="로그아웃" onclick="admin_check()">
		 		</form>
			</div>
			<div>
			</div>
			
			<div>
			<table class="table" >
			<tr class="jb-small">
				<th><input type="checkbox" id="checkall"/></th>
				<th>번호</th>
				<th>공지사항 제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>팝업 완료일</th>
			</tr>
				<c:if test="${empty list }">
					<!-- 데이터가 없는 경우 처리 -->
					<tr>
						<td colspan="5" >데이터가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<!-- 데이터의 갯수 만큼 tr을 만든다. : 반복문 -> jsp jstl 사용 태그로 작성 -->
				<c:forEach items="${list}" var="vo">
					<tr class="dataRow" onmouseover="this.style.background='white'" onmouseout="this.style.background=' #EAEAEA'" Style="cursor:pointer;" >
						<!-- 조회수 추가를 만들기 위해서 class no라는 함수를 클릭시 작동하게만듬 -->
						<td onclick="event.cancelBubble=true" width="50"><input type="checkbox" name="chk" value="${vo.no}"></td>
						<td class="no">${vo.no}</td>
						<td>${vo.title}</td>
						<td>${vo.writer}</td>
						<td><fmt:formatDate value="${vo.writeDate}"
								pattern="yyyy.MM.dd" /></td>
						<td>${vo.hit}</td>
						<td>${vo.popup_date}</td>
				</c:forEach>
				<tr>
					<td colspan="10" style="text-align: center"><pageObject:pageNav_notice
							listURI="notice_admin_popup.do" pageObject="${pageObject }" /></td>	
				</tr>
			</table>
			<button style="float: right; "type="button" onclick="notice_delete();">선택 팝업 삭제</button>

			
				
		</div>
	</div>
</body>
</html>