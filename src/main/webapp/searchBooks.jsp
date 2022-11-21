<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="book.BookDAO"%>
<%@ page import="book.BookDTO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width", initial-scale="1"> ?? 왜있음 몰라서 주석처리-->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>하루 한 권</title>
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
	body {
		background-color: #FFF0F0;
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
			int pageNumber = 1;
			if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
			<a class="navbar-brand" href="index.jsp">하루 한 권</a>
 		</div>
 		<div style="background-color: #FFD6D6;" class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
 			<ul class="nav navbar-nav">
 				<li class="active"><a style="background-color: #FFB9B9;" href="searchBooks.jsp">도서 검색</a></li>
 				<li><a href="index.jsp">도서 예약</a></li>
 				<li><a href="index.jsp">예약 조회</a></li>
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
	<div class="container">
		<div class="row">
			<table class="table table-danger table-striped" style="text-align: center; border: 1px solid #FFD6D6">
				<thead>
					<tr style="background-color: #FFB9B9;">
						<th style="text-align: center;">표지</th>
						<th style="text-align: center;">제목</th>
						<th style="text-align: center;">저자</th>
						<th style="text-align: center;">카테고리</th>
					</tr>
				</thead>
				<tbody>
					<%
					BookDAO bookDAO = new BookDAO();
					ArrayList<BookDTO> list = bookDAO.getList(pageNumber);
					for(int i = 0; i < list.size(); i++) {
						if (i % 2 == 0) {
					%>
					<tr style="background-color: #FFF0F0;">
						<td><%=list.get(i).getBookTitle() %></td>
						<td><%= list.get(i).getBookTitle()%></td>
						<!-- <td><a href="view.jsp?bbsID=<%= list.get(i).getBookTitle()%>"></a></td> -->
						<td><%=list.get(i).getAuthor() %></td>
						<td><%=list.get(i).getCategory() %></td>
					</tr>
					<%
							} else {
					%>
					<tr style="background-color: #FFDDDD;">
						<td><%=list.get(i).getBookTitle() %></td>
						<td><%=list.get(i).getBookTitle()%></td>
						<!-- <td><a href="view.jsp?bbsID=<%= list.get(i).getBookTitle()%>"></a></td> -->
						<td><%=list.get(i).getAuthor() %></td>
						<td><%=list.get(i).getCategory() %></td>
					</tr>
					<%
							}
						}
					%>
				</tbody>
			</table>
			<%
				if (pageNumber != 1) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arraw-Left">이전</a>
			<%
				} if (bookDAO.nextPage(pageNumber + 1)) {
			%>		
				<a href="bbs.jsp?pageNumber=<%=pageNumber +1 %>" class="btn btn-success btn-arraw-Left">다음</a>
			<%
				}
			%>
			<%= pageNumber %> 
			<%= bookDAO.nextPage(pageNumber + 1) %>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>