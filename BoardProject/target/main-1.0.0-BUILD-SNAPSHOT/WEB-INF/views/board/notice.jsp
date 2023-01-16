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
<title>공지사항</title>
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
      .zt-skill-bar {
        color: #fff;
        font-size: 11px;
        line-height: 20px;
        height: 20px;
        margin-bottom: 5px;

        background-color: rgba(0,0,0,0.1);

        -webkit-border-radius: 2px;
           -moz-border-radius: 2px;
            -ms-border-radius: 2px;
                border-radius: 2px;

    }

    .zt-skill-bar * {
        webkit-transition: all 0.5s ease;
          -moz-transition: all 0.5s ease;
           -ms-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
               transition: all 0.5s ease;
    }

    .zt-skill-bar div {
        background-color: #ffc600;
        position: relative;
        padding-left: 25px;
        width: 0;

        -webkit-border-radius: 2px;
           -moz-border-radius: 2px;
           -ms- border-radius: 2px;
                border-radius: 2px;
    }

    .zt-skill-bar span {
        display: block;
        position: absolute;
        right: 0;
        top: 0;
        height: 100%;
        padding: 0 5px 0 10px;
        background-color: #1a1a1a;

        -webkit-border-radius: 0 2px 2px 0;
           -moz-border-radius: 0 2px 2px 0;
            -ms-border-radius: 0 2px 2px 0;
                border-radius: 0 2px 2px 0;
    }

    .zt-skill-bar span:before {
        content: "";
        position: absolute;
        width: 6px;
        height: 6px;
        top: 50%;
        left: -3px;
        margin-top: -3px;
        background-color: #1a1a1a;

        -webkit-transform: rotate(45deg);
           -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
                transform: rotate(45deg);
    }
    
      div.left {
        width: 50%;
        float: left;
        box-sizing: border-box;
        
        background: #ff0;
    }
    div.right {
        width: 50%;
        float: right;
        box-sizing: border-box;
        
        background: #0ff;
    }

    </style>

    
    <script type="text/javascript">
	$(function() {

		/* dataRow에 대한 함수 */
		$(".dataRow").click(
				function() {
					var no = $(this).find(".no").text();
					location = "notice_view.do?no=" + no + "&inc=1"
							+ "&page=${pageObject.page}"
							+ "&perPageNum=${pageObject.perPageNum}"
							+ "&word=${pageObject.word}"
							+ "&start_date=${pageObject.start_date}"
							+ "&end_date=${pageObject.end_date}"
							;
				})
		
	})
	
 //쿠키 가져오는 부분
		function getCookie(name){   
		var wcname = name + '=';
		var wcstart, wcend, end;
		var i = 0;   
		  while(i <= document.cookie.length) {           
		   wcstart = i; 
		 wcend   = (i + wcname.length);           
		 if(document.cookie.substring(wcstart, wcend) == wcname) {                   
		  if((end = document.cookie.indexOf(';', wcend)) == -1)                          
		   end = document.cookie.length;                   
		  return document.cookie.substring(wcend, end);           
		   }           
		
		 i = document.cookie.indexOf('', i) + 1;           
		 
		   if(i == 0)                   
		  break;   
		  }   
		  return '';
		}
	/* 	window.screen.width
	// 좌우 크기 반환 Ex) 1920
	window.screen.height
	// 상하 크기 반환, Ex) 1080
	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
	var popupY= (window.screen.height / 2) - (popupHeight / 2);
	// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
	window.open("popup.do?no=1&inc=1", "no=1", " height=400, width=400, left="+ popupX + ", top="+ popupY); //윈도우 기쥰 */
	var popupWidth = 200;
	//팝업 넓이
	var popupHeight = 300;
	//높이
	var popupX = (window.outerWidth / 4) - (200 / 2);
	//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	var popupY= (window.outerHeight / 3) - (300 / 2);
	//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	
	//window.open("popup.do?no=3&inc=1", "no=4", " height=400, width=400, left="+ popupX + ", top="+ popupY);//창기준
	
	
			$.ajax({
			url:"popup_list.do", // 목적지
			type:"POST", // HTTP Method
			data:{"key": "key"}, // 전송 데이터
			dataType : 'json', // 전송 데이터 형식
				success:function(res){// 성공 시 실행
					for(var i=0; i<res.length; i++) {
						 popupX = popupX +20;//계단식으로 공지사항 보여줌
						 popupY = popupY +20;
							if(getCookie('pop_'+res[i]) != res[i]) {
						window.open("popup.do?no="+res[i]+"&inc=1", res[i], " height=400, width=400, left="+ popupX + ", top="+ popupY);
					}
							}
			},
			error:function(er){ //실패 시 실행
				alert("실패 원인 : " + er);
			}
		});

	
	
	
	//네비게이션바 스크립트
	(function( $ ) {
	    "use strict";
	    $(function() {
	        function animated_contents() {
	            $(".zt-skill-bar > div ").each(function (i) {
	                var $this  = $(this),
	                    skills = $this.data('width');

	                $this.css({'width' : skills + '%'});

	            });
	        }
	        
	        if(jQuery().appear) {
	            $('.zt-skill-bar').appear().on('appear', function() {
	                animated_contents();
	            });
	        } else {
	            animated_contents();
	        }
	    });
	}(jQuery));
	
/* 	실시간 데이터 열고 닫기 */
	function doDisplay(){
		var con = document.getElementById("myDIV");
		if(con.style.display=='none'){
			con.style.display = 'block';
		}else{
			con.style.display = 'none';
		}
	}
	/* 	로그아웃 */
	function user_check(){
		alert("로그아웃 완료")
		location ="user_logout.do";
	}
</script>
       <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
        //구글차트 
        google.charts.load('current', {'packages':['corechart']}); 
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('string','memo');
            data.addColumn('number','percent');
            
            <c:forEach items="${rank}" var="rank">
            data.addRow( 
                ['${rank.value}',${rank.count}]
               
            );
        	</c:forEach>

            var opt = {
            		   'title':'실시간 검색 순위',
                       'width':600,
                       'height':400, 
                       is3D: true,
            };
            var chart = new google.visualization.PieChart(document.getElementById('myChart'));
            chart.draw(data,opt);
        }
 
        </script>
        
       <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
        //구글차트 
        google.charts.load('current', {'packages':['corechart']}); 
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('string','memo');
            data.addColumn('number','percent');
            
            <c:forEach items="${hit_rank}" var="hit_rank" >
            data.addRow( 
                ['${hit_rank.title}',${hit_rank.hit}]
               
            );
        	</c:forEach>

            var opt = {
                    'title':'실시간 조회수 순위',
                    'width':600,
                    'height':400, 
                    is3D: true,
                    
            };
            var chart = new google.visualization.PieChart(document.getElementById('myChart1'));
            chart.draw(data,opt);
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
				<h2 style="display:inline;"><a href="notice.do">공지사항</a></h2><p style="display:inline;">&nbsp;&nbsp;&nbsp;전체 공지사항입니다.</p>
				<form style="display:inline; float: right;">
				<p style="display:inline; text-align: right;">${user_name}님 환영합니다.</p>
		 		<input type="button" value="로그아웃" onclick="user_check()">
		 		</form>
			</div>
			<div style="border: 1px solid #EAEAEA; padding: 10px; height: auto; min-height: 30px; overflow: auto ;">
			 <a href="javascript:doDisplay();"> 실시간 데이터 보기 (클릭)</a>
<!-- 			 <input style='float: right;' type='button'  onclick="location.href='notice_login.do'" value='공지사항 관리' /> -->
			</div>
			<div id="myDIV" style="display:none;" class="top_gragh" style="display:flex;"> <!-- 실시간 데이터 표 -->
				
				
					 	<div id="myChart"class="left"></div> <div id="myChart1" class="right"></div>
					 	
				</div>
			
			
			
		<div style="text-align: right;">
			<form class="navbar-form" id="date_check">

				<div style="display: inline">
					<input type="date" name="start_date"
						value="${pageObject.start_date}">~<input type="date"
						name="end_date" value="${pageObject.end_date}">
				</div>
				<div style="display: inline">
					<input type="text" placeholder="Search" name="word"
						value="${pageObject.word}">
				</div>
				<div style="display: inline">
					<button class="btn btn-default" id="btn" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</form>
		</div>
		
			<div>
			<table class="table" >
			<tr class="jb-small">				
				<th>번호</th>
				<th>공지사항 제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
				<c:if test="${empty list }">
					<!-- 데이터가 없는 경우 처리 -->
					<tr>
						<td colspan="5" >데이터가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<!-- 데이터의 갯수 만큼 tr을 만든다. : 반복문 -> jsp jstl 사용 태그로 작성 -->
				<c:forEach items="${list}" var="vo">
					<tr class="dataRow" onmouseover="this.style.background='#EAEAEA'" onmouseout="this.style.background='white'" Style="cursor:pointer;">
						<!-- 조회수 추가를 만들기 위해서 class no라는 함수를 클릭시 작동하게만듬 -->
						<td class="no">${vo.no}</td>
						<td>${vo.title}</td>
						<td>${vo.writer}</td>
						<td><fmt:formatDate value="${vo.writeDate}"
								pattern="yyyy.MM.dd" /></td>
						<td>${vo.hit}</td>
				</c:forEach>
				<tr>
					<td colspan="10" style="text-align: center"><pageObject:pageNav_notice
							listURI="notice.do" pageObject="${pageObject }" /></td>
				</tr>
			</table>
	</div>
	</div>
</body>
</html>