<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="book.BookDTO"%>
<%@ page import="book.BookDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>하루 한 권</title>
<style>
	body, html {
		height: 100%;
		
	}
	.container-background {
		background-color: #FFF0F0;
		height: 100%;
		display: flex;
	    justify-content: center;
	    align-items: flex-end;
	}
	.container-book {
		background-color: white;
		height: 90%;
		border-top-left-radius: 7%;
		border-top-right-radius: 7%; 
	}
	.container-header {
		height: auto;
	    margin-top: 5%;
	    text-align: center;
	    font-size: 40px;
	}
	.container-carousel {
		display: flex;
	    justify-content: center;
	    margin-top: 5%;
	}
	.container-summary {
		height: 20%;
	    text-align: center;
		margin-top: 5%;
	    margin-left: 5%;
	    margin-right: 5%;
	    font-size: 15px;
	}
	.btn {
		width: 20%;
		border-radius: 10px;
	}
	.container-btn {
		display: flex;
	    justify-content: space-evenly;
	}
</style>
</head>
<body>
	<%		
		String bookTitle = "";
		if (request.getParameter("bookTitle") != "") {
			bookTitle = request.getParameter("bookTitle");
		}
		
		
		BookDTO book = new BookDAO().getBook(bookTitle);
		
		if(book == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('책 정보가 없습니다.')");
			script.println("location.href = 'searchBooks.jsp'");
			script.println("</script>");
		}
		
	%>
	<%@ include file="/component/nav.jsp" %>
	<div class="container-background">
		<div style="width:700px;" class="container-book">
			<div class="container-header">
				<%=book.getBookTitle() %>
			</div>
			<div class="container-carousel">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<div style="position: relative; width: 100%; overflow: hidden; border-radius: 10%;" class="carousel-inner">
						<div class="item active">
							<img style="width: 450px; height: 450px" src="images/1.jpg">
						</div>
						<div class="item">
							<img style="width: 450px; height: 450px" src="images/2.jpg">
						</div>
						<div class="item">
							<img style="width: 450px; height: 450px" src="images/3.jpg">
						</div>
					</div>
					<a style="margin-top: 10%; height: 80%;" class="left carousel-control" href="#myCarousel" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span>
					</a>
					<a style="margin-top: 10%; height: 80%;" class="right carousel-control" href="#myCarousel" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
			</div>
			<div class="container-summary">
				<h2><%=book.getBookTitle() %></h3>
				<%=book.getBookSummary() %>
			</div>
			<div class="container-btn">
				<button style="height: 4%;" type="button" class="btn btn-danger">예약</button>
				<button style="height: 4%;" type="button" class="btn btn-danger">목록</button>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>