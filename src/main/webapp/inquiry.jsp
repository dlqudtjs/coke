<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="borrow.BorrowDAO"%>
<%@ page import="borrow.BorrowDTO"%>
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
	.row {
	    margin-top: 100px;
	}
</style>
</head>
<body>
	<%@ include file="/component/nav.jsp" %>
	<%
		if (session.getAttribute("userID") == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 후 이용가능한 페이지입니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<div class="container">
		<div class="row">
			<table class="table table-danger table-striped" style="text-align: center; border: 1px solid #FFD6D6">
				<thead>
					<tr style="background-color: #FFB9B9;">
						<th style="text-align: center;">제목</th>
						<th style="text-align: center;">빌린 일</th>
						<th style="text-align: center;">빌린 시간</th>
						<th style="text-align: center;">반납 일</th>
					</tr>
				</thead>
				<tbody>
					<%
					BorrowDAO borrow = new BorrowDAO();
					ArrayList<BorrowDTO> list = borrow.getList(userID, pageNumber);
					if(list.size() == 0) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('조회된 목록이 없습니다.');");
						script.println("history.back();");
						script.println("</script>");
						script.close();
					}
					for(int i = 0; i < list.size(); i++) {
						if (i % 2 == 0) {
					%>
					<tr style="background-color: #FFF0F0;">
						<td><%=list.get(i).getBookTitle() %></td>
						<td><%=list.get(i).getBorrowDate() %></td>
						<td><%=list.get(i).getBorrowTime() %></td>
						<td><%=list.get(i).getReturnDate() %></td>
					</tr>
					<%
							} else {
					%>
					<tr style="background-color: #FFDDDD;">
						<td><%=list.get(i).getBookTitle() %></td>
						<td><%=list.get(i).getBorrowDate() %></td>
						<td><%=list.get(i).getBorrowTime() %></td>
						<td><%=list.get(i).getReturnDate() %></td>
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
				<a href="inquiry.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-Left">이전</a>
			<%
				} if (borrow.nextPage(pageNumber + 1)) {
			%>		
				<a href="inquiry.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-Left">다음</a>
			<%
				}
			%>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>