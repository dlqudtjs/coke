<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하루 한 권</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		String userPassword = null;
		
		//앞에 페이지로부터 불러들인 값이 널이 아닐 때
		if(request.getParameter("userID") != null) {
			userID = (String) request.getParameter("userID");
		}
	
		//앞에 페이지로부터 불러들인 값이 널이 아닐 때
		if(request.getParameter("userPassword") != null) {
			userPassword = (String) request.getParameter("userPassword");
		}	
	
		// 새로운 데이터베이스 접근 객체 생성
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		
		if (result == 1) {
			// 로그인이 되었을 때
			// session에 로그인 기록 남기기(나중에 로그아웃 할 때 활용)
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 하셨습니다');");
			script.println("location.href='main.jsp'");
			//로그인하면 이용할 수 있는 main.jsp로 이동
			script.println("</script>");
			script.close();
		} else if (result == 0) {
			// 비밀번호가 틀릴 때
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else if (result == -1) {
			// 아이디가 없을 때
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else if (result == -2) {
			// 데이터베이스 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		}
	%>
</body>
</html>