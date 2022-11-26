<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.UserDTO" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		String userPassword = null;
	
		// 로그인이 되어있다면
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID"); 
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("<alert('이미 로그인이 되었습니다.')>");
			script.println("<history.back()>");
			script.println("</script>");
		}

		// 이메일이나 비밀번호나 이메일 중 하나라도 입력이 되지 않으면 경고문 띄움
		if (user.getUserID() == null || user.getUserPassword() == null || user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else {
			// 셋다 잘 들어왔다면
			UserDAO userDAO = new UserDAO();
			// 디비에 접근하는 객체 생성
			int result = userDAO.join(user);
			// join 실행
			// 이때 result는 인설트한 행의 값을 내놓음
			if (result == -1) {
				// 기본키에 의해 오류 발생하면 -1 반환 (이미 있다면)
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
			} else {
				//회원가입이 성공적으로 이루어졌다면 세선 생성
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='index.jsp'");
				script.println("alert('회원가입이 완료되었습니다.')");
				script.println("</script>");
				script.close();
			}
		}
	%>
</body>
</html>