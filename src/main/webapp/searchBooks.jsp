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
<meta name="viewport" content="width=device-width", initial-scale="1">
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
						if (i % 2 == 0) {
					%>
					<tr style="background-color: #FFF0F0;">
						<td><%=list.get(i).getBookTitle() %></td>
						<td><a href="view.jsp?bookTitle=<%= list.get(i).getBookTitle()%>"><%=list.get(i).getBookTitle() %></a></td>
						<td><%=list.get(i).getAuthor() %></td>
						<td><%=list.get(i).getCategory() %></td>
					</tr>
					<%
							} else {
					%>
					<tr style="background-color: #FFDDDD;">
						<td><%=list.get(i).getBookTitle() %></td>
						<td><a href="view.jsp?bookTitle=<%= list.get(i).getBookTitle()%>"><%=list.get(i).getBookTitle() %></a></td>
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