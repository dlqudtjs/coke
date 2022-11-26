<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>하루 한 권</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<style type="text/css">
	body, html {
		background-color: #white;
		height: 1000px;
		width: 100%;
		overflow: hidden;
	}
	img {
		width: 35%;
		margin-top: -23rem;
	    border-radius: 30px;
	    box-shadow: 0 5px 10px rgb(0 0 0 / 16%), 0 5px 10px rgb(0 0 0 / 23%);
	}
	.background_box {
		height: 1000px;
		width: 100%;
	}
	.top {
		background-color: #ffd1d1;
		height: 400px;
		width: 100%;
	    margin-top: 70px;
        margin-top: 70px;
	    padding: 90px;
	    text-align: center;
	}
	.bottom {
		background-color: white;
		height: 220px;
		width: 100%;
		display: flex;
	    justify-content: center;
	    align-items: center;
	}
	.bottom_write {
		height: 250px;
		text-align: center;
		padding-left: 90px;
    	padding-right: 90px;
	}
</style>
</head>
<body>
	<%@ include file="/component/nav.jsp" %>
	<div class="background_box">
		<div class="top">
			<h1 style="color: #694b4b">The harder you work, the more likely you can reach the goal.</h1>
			<p>더 열심히 할수록 목표에 더 가까워질 거예요.</p>
		</div>
		<div class="bottom">
			<img src="images/book.jpg">
		</div>
		<div class="bottom_write">
			<p>내 인생을 바꾸는 사람은 자신입니다. 아무도 대신해줄 수 없어요.</p>
			<h1 style="color: #694b4b">Only I can change me life, no one can do it for me.</h1>
		</div>
	</div>
</body>
</html>