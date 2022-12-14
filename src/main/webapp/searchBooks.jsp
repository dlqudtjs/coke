<%@page import="java.util.StringTokenizer"%>
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
	td {
	    vertical-align: baseline !important;
	    border: 0px !important;
	}
	
	.row {
	    margin-top: 100px;
	}
	.btn-success {
		color: #fff;
	    background-color: #ffbbbb;
	    border-color: #ffbbbb;
	}
	.btn-success:hover {
		color: #fff;
	    background-color: #ff5164;
	    border-color: #ff5164;
	}
</style>
</head>
<body>
	<%
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<%@ include file="/component/nav.jsp" %>
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
						String str = list.get(i).getImageURL();
						String[] images = str.split(";");
						if (i % 2 == 0) {
					%>
					<tr style="background-color: #FFF0F0;">
						<td><a href="view.jsp?bookTitle=<%= list.get(i).getBookTitle()%>"><img src="<%=images[0] %>.jpg" style="width: 100px"></a></td>
						<td><a style="font-weight: 900" href="view.jsp?bookTitle=<%= list.get(i).getBookTitle()%>"><%=list.get(i).getBookTitle() %></a></td>
						<td><%=list.get(i).getAuthor() %></td>
						<td><%=list.get(i).getCategory() %></td>
					</tr>
					<%
							} else {
					%>
					<tr style="background-color: #FFDDDD;">
						<td><a href="view.jsp?bookTitle=<%= list.get(i).getBookTitle()%>"><img src="<%=images[0] %>.jpg" style="width: 100px"></a></td>
						<td><a style="font-weight: 900" href="view?bookTitle=<%= list.get(i).getBookTitle()%>"><%=list.get(i).getBookTitle() %></a></td>
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
				<a href="searchBooks.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-Left">이전</a>
			<%
				} if (bookDAO.nextPage(pageNumber + 1)) {
			%>		
				<a href="searchBooks.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-Left">다음</a>
			<%
				}
			%>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>