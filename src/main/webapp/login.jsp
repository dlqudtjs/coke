<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/custom.css">
<title>하루 한 권</title>
</head>
	<!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <style>
    html{
    	height: 100%;
    	background-color: black;
    }
    body{
	    width: 100%;
	    height: 100%;
	    margin: 0;
	  background-size: cover;
	  overflow:hidden;
    }
    hr {
    	height: 3px;
    	background: black;
    	border: 0;
    	margin: 0px;
    }
    header {
    	background-color: #FFD6D6;
    	display: flex;
	    align-items: center;
	    justify-content: center;
	    font-size: 25px;
    }
    h5 {
    	margin-top: 30%;
    	margin-bottom: 30%;
    }
    
.box_container_left{
	background-color: #FFF0F0;
	height: 100%;
	float: left;
	text-align: center;
	width: 50%;
	display: flex;
    justify-content: center;
    align-items: center;
}
.box_container_right{
	background-color: #FFF0F0;
	height: 100%;
	float:right;
	text-align: center;
	width: 50%;
	display: flex;
    justify-content: center;
    align-items: center;
}
.box_left {
	background-color: #FFD6D6;
	height:55%;
	width: 70%;
}

.box_right {
	background-color: #FFD6D6;
	height:55%;
	width: 70%;
}

.box_left:hover {
	background-color: #FFB9B9;
}

.box_right:hover {
	background-color: #FFB9B9;
}

.modal-body {
	background-color: #FFD6D6;
}

.modal-header {
	background-color: #FFC2C2;
}

.form-control {
	background-color: #FFF0F0;
}

</style>

<body>
	<header><a style="color: black; text-decoration-line: none;" href="index.jsp" >하루 한 권</a></header>
	<hr>
	<div class="box_container_left">
		<div class="box_left" >
		<div><h5 style="color:white; font-size: 2.5em;">회원이십니까?</h5></div>
		<a style="color: black;" class="btn btn-outline-warning btn-lg mx-3 mt-2" data-toggle="modal" href="#loginModal">로그인</a>
		</div>
	</div>
	<div class="box_container_right">
		<div class="box_right">
		<div><h5 style="color:white; font-size: 2.5em;">회원이 아니십니까?</h5></div>
		<a style="color: black;" class="btn btn-outline-warning btn-lg mx-1 mt-2" data-toggle="modal" href="#joinModal">회원가입</a>
		</div>
	</div>
	<!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="./js/jquery.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->
    <script src="./js/bootstrap.min.js"></script>
		<!-- 로그인 모달 -->
		<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">로그인</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="./loginAction.jsp" method="post">
						<!-- 아이디 -->
							<div class="form-group">
								<label>아이디</label> <input type="text" name="userID" class="form-control">
							</div>
							<!-- 비밀번호 -->
							<div class="form-group">
								<label>비밀번호</label> <input type="password" name="userPassword" class="form-control">
							</div>
							<div class="modal-footer">
								<button style="background-color: pink; color: white;" type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
								<button style="background-color: pink; color: white;" type="submit" class="btn btn-warning">로그인</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 회원가입 모달 -->
		<div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">회원가입</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="./joinAction.jsp" method="post">
							<!-- 아이디 -->
							<div class="form-group">
								<label>아이디</label> <input type="text" name="userID" class="form-control">
							</div>
							
							<!-- 비밀번호 -->
							<div class="form-group">
								<label>비밀번호</label> <input type="password" name="userPassword" class="form-control">
							</div>
							
							<!-- 이메일 -->
							<div class="form-group">
								<label>이메일</label> <input type="text" name="userEmail" class="form-control">
							</div>
							
							<div class="modal-footer">
								<button style="background-color: pink; color: white;" type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
								<button style="background-color: pink; color: white;" type="submit" class="btn btn-warning">회원가입</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>