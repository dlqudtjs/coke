<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하루 한 권</title>
</head>
<body>
	<%
		session.invalidate();
		// 앞에 로그인 단계에서 설정해놓은 userID 정보를 폐기하기 위해 설정
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그아웃 되었습니다.');");
		script.println("location.href='main.jsp'");
		script.println("</script>");
		script.close();
	%>
</body>
</html>