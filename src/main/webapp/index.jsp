<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>하루 한 권</title>
<style type="text/css">
	body {
		background-color: #FFF0F0;
	}
	
	.jumbotron {
		background-color: #FFF0F0;
	}
	.animated-title {font-size:60px; font-family:'Raleway',Sans-serif; font-weight:300; position: relative; width: 100%;max-width:100%; height: auto; padding:100px 0; overflow-x: hidden; overflow-y: hidden; }
	.animated-title .track {position: absolute; white-space: nowrap;will-change: transform;animation: marquee 10s linear infinite; }
	@keyframes marquee {
	  from { transform: translateX(0); }
	  to { transform: translateX(-50%); }
	}
	@media (hover: hover) and (min-width: 700px){
	.animated-title .content {-webkit-transform: translateY(calc(100% - 8rem)); transform: translateY(calc(100% - 8rem));}
	}
</style>
</head>
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
			<a style="background-color: #FFB9B9;" class="navbar-brand" href="index.jsp">하루 한 권</a>
 		</div>
 		<div style="background-color: #FFD6D6;" class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
 			<ul class="nav navbar-nav">
 				<li><a href="searchBooks.jsp">도서 검색</a></li>
 				<li><a href="index.jsp">도서 예약</a></li>
 				<li><a href="index.jsp">예약 조회</a></li>
 			</ul>
 			<%	//로그인이 되지 않았다면
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
	<div style="margin-top:5%;" class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/1.jpg">
				</div>
				<div class="item">
					<img src="images/2.jpg">
				</div>
				<div class="item">
					<img src="images/3.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<div class="container">
		<div style="margin-top:5%;" class="jumbotron">
			<div class="container">
				<div class="animated-title">
				  <div class="track">
				    <div class="content"> &nbsp;책은 인생의 험준한 바다를 항해하는데 도움이 되게 남들이 마련해 준 나침반이요, 망원경이고 육분의고 도표이다. - 제시 리 베넷&nbsp;하드웨어의 정의 : "사람이 발로 걷어찰 수 있는 컴퓨터의 부분"  </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>