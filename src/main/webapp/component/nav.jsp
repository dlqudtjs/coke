<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
	.navbar {
		margin-bottom: 0px;		
		border: 0px;
	}
</style>
<body>
	<%
		String userID = null;
		//세선 정보가 있으면
		if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
		}
		
	%>
	<nav class="navbar navbar-default">
		<div style="background-color: #FFD6D6;" class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a id="nav_selected" class="navbar-brand" href="index.jsp">하루 한 권</a>
 		</div>
 		<div style="background-color: #FFD6D6;" class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
 			<ul class="nav navbar-nav">
 				<li id="nav_selected"><a href="searchBooks.jsp">도서 검색</a></li>
 				<li id="nav_selected"><a href="index.jsp">도서 예약</a></li>
 				<li id="nav_selected"><a href="index.jsp">예약 조회</a></li>
 			</ul>
 			<%
 			if(userID == null) {
 			%>
 			<ul class="nav navbar-nav navbar-right">
 				<li class="dropdown">
 					<a href="#" class="dropdown-toggle"
 						data-toggle="dropdown" role="button" aria-haspopup="true"
 						aria-expanded="false">접속하기<span class="caret"></span></a>
 					<ul class="dropdown-menu">
 						<li><a href="login.jsp">로그인 및 회원가입</a></li>
 					</ul>
 				</li>
 			</ul>
 			<%
 			} else {
 			%>
			<ul class="nav navbar-nav navbar-right">
 				<li class="dropdown">
 					<a href="#" class="dropdown-toggle"
 						data-toggle="dropdown" role="button" aria-haspopup="true"
 						aria-expanded="false">회원관리<span class="caret"></span></a>
 					<ul class="dropdown-menu">
 						<li><a href="logoutAction.jsp">로그아웃</a></li>
 					</ul>
 				</li>
 			</ul>
			<%
			}
			%>
 		</div>
	</nav>
</body>
</html>