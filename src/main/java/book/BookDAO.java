package book;

import db.Config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDAO {
	private Connection conn;
	private ResultSet rs;
	
	public BookDAO() {
		try {
			//db 접근
			Config config = new Config();
			String dbURL = config.getDbURL();
			String dbID = config.getDbID();
			String dbPassword = config.getDbPassword();
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getNext() {
		String SQL = "select bbsID from bbs order by bbsID desc";
		try {
			// 실행 준비 단계
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			// 실행 결과를 rs에 담기
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<BookDTO> getList(int pageNumber) {
		//bookDB에 저장된 num 기준으로 10개만 가져온다.
		String SQL = "select @num:=@num+1 AS num, bookTitle, author, bookSummary, category, imageURL from (SELECT @num:=0) AS n, book order by num limit ?, 10";
		ArrayList<BookDTO> list = new ArrayList<BookDTO>(); 
		try {
			// 실행 준비 단계
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, pageNumber - 1);
			// 실행 결과를 rs에 담기
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookDTO book = new BookDTO();
				book.setBookTitle(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setBookSummary(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setImageURL(rs.getString(6));
				list.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		//다음 페이지가 있는지 확인하는 메소드
		String SQL = "select count(*) from book;";
		try {
			// 실행 준비 단계
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			// 실행 결과를 rs에 담기
			rs = pstmt.executeQuery();
			int count = rs.getInt(1);
			if (count > ((pageNumber - 1) * 10) + 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public BookDTO getBook(String bookTitle) {
		//bookTitle를 받아 정보를 보내주는 메소드
		String SQL = "select * from book where bookTitle = ?;";
		try {
			// 실행 준비 단계
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bookTitle);
			// 실행 결과를 rs에 담기
			rs = pstmt.executeQuery();
			if (rs.next()) {
				BookDTO book = new BookDTO();
				book.setBookTitle(rs.getString(1));
				book.setAuthor(rs.getString(2));
				book.setBookSummary(rs.getString(3));
				book.setCategory(rs.getString(4));
				book.setImageURL(rs.getString(5));
				return book;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
//	public int delete(int bbsID) {
//		//삭제는 하지 않고 Available 값을 0으로 바꿔 유효하지 않는 글로 바꿈
//		String SQL = "update bbs set bbsAvailable = 0 where bbsID = ?";
//		try {
//			// 실행 준비 단계
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1, bbsID);
//			return pstmt.executeUpdate(); //성공적으로 실행했다면
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return -1; //데이터베이스 오류
//	}	
}
