<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="book.BookDAO"%>
<%@ page import="borrow.BorrowDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String userID = (String) session.getAttribute("userID"); 
		String title = request.getParameter("bookTitle");
		String date = request.getParameter("date"); 
		String time = request.getParameter("time");
		String returnDate = request.getParameter("returnDate");
		
		if(userID == null || title == "" || date == "" || time == "" || returnDate == "") {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else {
			//이상이 없다면
			BookDAO book = new BookDAO();
			
			//해당하는 책이 없다면
			if(book.getBook(title) == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('검색한 책이 존재하지 않습니다.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
			} else {
				BorrowDAO borrow = new BorrowDAO();
				boolean check = borrow.reserveBook(userID, title, date, time, returnDate);
				
				if(check) {
					//정상적으로 예약 했다면
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('예약이 완료되었습니다.');");
					script.println("location.href='index.jsp'");
					script.println("</script>");
					script.close();
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('예약에 실패하셨습니다.');");
					script.println("location.href='index.jsp'");
					script.println("</script>");
					script.close();
				}
			}
		}
	%>
</body>
</html>