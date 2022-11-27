<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="slide navbar style.css">
<link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
<style>
	body{
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	font-family: 'Jost', sans-serif;
	background: linear-gradient(to bottom, #ffccc6, #ffe3e3, #ffb4b4);
	}
	.main{
		width: 350px;
		height: 500px;
		background: red;
		overflow: hidden;
		background: url("https://doc-08-2c-docs.googleusercontent.com/docs/securesc/68c90smiglihng9534mvqmq1946dmis5/fo0picsp1nhiucmc0l25s29respgpr4j/1631524275000/03522360960922298374/03522360960922298374/1Sx0jhdpEpnNIydS4rnN4kHSJtU1EyWka?e=view&authuser=0&nonce=gcrocepgbb17m&user=03522360960922298374&hash=tfhgbs86ka6divo3llbvp93mg4csvb38") no-repeat center/ cover;
		border-radius: 10px;
		box-shadow: 0px 10px 30px #000
	}
	label{
		color: #fff;
		font-size: 2.3em;
		justify-content: center;
		display: flex;
		margin: 60px;
		font-weight: bold;
		cursor: pointer;
		transition: .5s ease-in-out;
	}
	input{
		width: 60%;
		height: 20px;
		background: #white;
		justify-content: center;
		display: flex;
		margin: 20px auto;
		padding: 10px;
		border: none;
		outline: none;
		border-radius: 5px;
	}
	button{
		background: #ffbcbc;
		width: 60%;
		height: 40px;
		margin: 10px auto;
		justify-content: center;
		display: block;
		color: #fff;
		font-size: 1em;
		font-weight: bold;
		margin-top: 20px;
		outline: none;
		border: none;
		border-radius: 5px;
		transition: .2s ease-in;
		cursor: pointer;
	}
	button:hover{
		background: #ff9292;
	}
	.login{
		height: 460px;
		background: #fff9f9;
		border-radius: 60% / 10%;
		transform: translateY(-180px);
		transition: .8s ease-in-out;
	}
	.login label{
		color: #ffbcbc;
		transform: scale(.6);
	}
	.signup{
		position: relative;
		width:100%;
		height: 100%;
	}
	
	#chk:checked ~ .login{
		transform: translateY(-500px);
	}
	#chk:checked ~ .login label{
		transform: scale(1);	
	}
	#chk:checked ~ .signup label{
		transform: scale(.6);
	}
	#chk{
		display: none;
	}
</style>
</head>
<body> 
	<%@ include file="/component/nav.jsp" %>
	<div class="main">  	
		<input type="checkbox" id="chk" aria-hidden="true">

			<div class="signup">
				<form action="joinAction.jsp" method="post">
					<label for="chk" aria-hidden="true">Sign up</label>
					<input type="text" name="userID" placeholder="userID">
					<input type="password" name="userPassword" placeholder="userPassword">
					<input type="Email" name="userEmail" placeholder="userEmail">
					<button>Sign up</button>
				</form>
			</div>

			<div class="login">
				<form action="loginAction.jsp" method="post">
					<label for="chk" aria-hidden="true">Login</label>
					<input type="text" name="userID" placeholder="userID">
					<input type="password" name="userPassword" placeholder="userPassword">
					<button type="submit">Login</button>
				</form>
			</div>
	</div>
</body> 
</html>