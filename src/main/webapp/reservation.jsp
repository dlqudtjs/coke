<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<style>
	html, body {
		background-color: #FFF0F0;
		height: 100%;
		width: 100%;
	}
	img {
		position: absolute;
		width: 100%;
		bottom: 0;
	}
	label {
		margin-bottom: 0px;
	}
	input {
		width: 250px;
	}
	.background_box {
		height: 94%;
		width: 100%;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}
	.reservation_box {
		position: fixed;
		background-color: #FFDDDD;
		height: 450px;
    	width: 800px;
	}
	.left_container {
		background-color: #807182;
		position: relative;
    	height: 100%;
		width: 40%;
		float: left;
	}
	.left_container h1 {
		text-align: center;
	    margin-top: 0px;
	    margin-bottom: 0px;
	    padding-top: 40px;
	    font-size: 30px;
	}
	.right_container {
	    width: 60%;
		height: 100%;
	    float: right;
	}
	.input_container {
		width: 100%;
		height: 85%;
		padding: 50px;
		display: flex;
	    flex-wrap: wrap;
	    align-items: center;
	}
	.button_container {
		background-color: white;
		width: 100%;
		height: 15%;
	    padding: 21px;
	}
	.button_set {
		display: flex;
		justify-content: space-around;
	}
	button#back {
	    background: white;
    	color: black;
    	transition: 0.2s all ease-in-out;
	}
	button#reservation {
	    background: #807182;
	    color: white;
	    border: 1px solid transparent;
	    transition: 0.2s all ease-in-out;
	}
	button {
		border: 1px solid rgba(0, 0, 0, 0.2);
	    height: 32px;
	    width: 95px;
	    border-radius: 19px;
	    font-family: "Montserrat", sans-serif;
	}
	button#back:hover {
		background: black;
		color: white;
	}
	button#reservation:hover {
		background: black;
	}
	.search, .date, .time, .return_date {
		height: 30px;
		width: 100%;
		display: flex;
    	align-items: center;
   	    justify-content: space-around;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="component/nav.jsp" %>
	<div class="background_box">
		<div class="reservation_box">
			<div class="left_container">
				<h1>Reservation</h1>
				<div class="dog">
					<img src="images/dog.jpg">
				</div>
			</div>
			<div class="right_container">
				<div class="input_container">
					<div class="search">
						<label>도서 검색</label>
						<input id="search" placeholder="도서를 검색하세요" type="text">
					</div>
					<div class="date">
						<label>예약 날짜</label>
						<input id="search" placeholder="날짜를 선택하세요" type="text">
					</div>
					<div class="time">
						<label>예약 시간</label>
						<input id="search" placeholder="시간을 선택하세요" type="text">
					</div>
					<div class="return_date">
						<label>반납 날짜</label>
						<input id="search" placeholder="도서를 선택하세요" type="text" disabled="disabled">
					</div>
				</div>
				<div class="button_container">
					<div class="button_set">
						<button id="back">Back</button>
						<button id="reservation">Reserve</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>