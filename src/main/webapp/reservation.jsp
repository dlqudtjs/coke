<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="js/data.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
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
<script>
	$(function() {	//?????? ????????? ??????
		$("#input_search").autocomplete({  //?????? ???????????? ??????
			source: List,	// source??? data.js?????? ????????? List ??????
			focus : function(event, ui) { // ???????????? ?????????????????? ?????? ???????????? ????????????	
				return false;
			},
			minLength: 1,// ?????? ?????????
			delay: 100,	//autocomplete ????????? ??????(ms)
			//disabled: true, //???????????? ?????? ??????
		});
		
		$('#input_date').datepicker({
			dateFormat : "yy-mm-dd",
		    // endDate : "infinity",
		    autoclose : true, 
		    todayHighlight :true,  // ????????? ???????????????. default ??? false
		    onSelect: function() {
		    	let date = new Date($("#input_date").val());
		    	date.setMonth(date.getMonth() + 1); //??? ?????? ????????? +2??? ????????????.
				var month = (date.getMonth() + 1) < 10 ? '0' + (date.getMonth() + 1) : (date.getMonth() + 1);
				var day =  date.getDate() < 10 ? '0' + date.getDate() : date.getDate();
				tmp.value = date.getFullYear() + "-" + month + "-" + day;
		    }
		}).datepicker("setDate", new Date());
	    
	    $("#input_time").timepicker({
	        timeFormat: 'h:mm p',
	        interval: 10,
	        minTime: '10',
	        maxTime: '6:00pm',
	        defaultTime: '11',
	        startTime: '10:00',
	        dynamic: false,
	        dropdown: true,
	        scrollbar: true        
	    });
	   	let date = new Date($("#input_date").val());
	    const tmp = document.getElementById("input_return_date");
	    date.setMonth(date.getMonth() + 1); //??? ?????? ????????? +2??? ????????????.
	    var month = (date.getMonth() + 1) < 10 ? '0' + (date.getMonth() + 1) : (date.getMonth() + 1);
	    var day =  date.getDate() < 10 ? '0' + date.getDate() : date.getDate();
	    tmp.value = date.getFullYear() + "-" + month + "-" + day;
 	});
</script>
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
				<form action="reserveAction.jsp" method="post" style="height: 100%">
					<div class="input_container">
							<div class="search">
								<label>?????? ??????</label>
								<input id="input_search" placeholder="????????? ???????????????" name="bookTitle" type="text">
							</div>
							<div class="date">
								<label>?????? ??????</label>
								<input id="input_date" name="date" type="text">
							</div>
							<div class="time">
								<label>?????? ??????</label>
								<input id="input_time" placeholder="????????? ???????????????" name="time" type="text">
							</div>
							<div class="return_date">
								<label>?????? ??????</label>
								<input style="background-color: #cacaca" id="input_return_date" name="returnDate" type="text" readonly="readonly">
							</div>
					</div>
					<div class="button_container">
						<div class="button_set">
							<button type="button" id="back">Back</button>
							<button type="submit" id="reservation">Reserve</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>