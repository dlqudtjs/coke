<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
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
	
		// 로그인이 되어있다면
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID"); 
		}
		if (userID == null) { //로그인이 되어 있을 때
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0) {
			//존재하지 않는 글일 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())) {
			//작성자가 아닐 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		} else {
			// 제목, 내용을 입력하지 않았을 경우
			if (request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
				|| request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.');");
				script.println("history.back()");
				script.println("</script>");
				script.close();
			} else {
				// 앞서 정보가 들어왔다면
				BbsDAO bbsDAO = new BbsDAO();
				// 디비에 접근하는 객체 생성
				int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"),  request.getParameter("bbsContent"));
				// join 실행
				// 이때 result는 인설트한 행의 값을 내놓음
				if (result == -1) {
					// 기본키에 의해 오류 발생하면 -1 반환 (이미 있다면)
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('수정에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
					script.close();
				} else { //글수정에 성공했다면
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기가 완료되었습니다..')");
					script.println("location.href='bbs.jsp';");
					script.println("</script>");
					script.close();
				}
			}
		}
	%>
</body>
</html>