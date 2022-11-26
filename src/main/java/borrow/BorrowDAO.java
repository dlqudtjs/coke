package borrow;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.Config;

public class BorrowDAO {
	private Connection conn;
	private ResultSet rs;
	
	public BorrowDAO() {
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
	
	public boolean reserveBook(String id, String title, String date, String time, String returnDate) {
		String SQL = "insert into borrow values(?, ?, ?, ?, ?);";
		try {
			// 실행 준비 단계
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setString(3, date);
			pstmt.setString(4, time);
			pstmt.setString(5, returnDate);
			int result = pstmt.executeUpdate();
			if(result != -1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public ArrayList<BorrowDTO> getList(String id, int pageNumber) {
		//borrowDB에 저장된 num 기준으로 10개만 가져온다.
		String SQL = "select @num:=@num+1 AS num, userID, bookTitle, borrowedDate, borrowedTime, returnDate from (SELECT @num:=0) AS n, borrow where userID = ? order by num limit ?, 10;";
		ArrayList<BorrowDTO> list = new ArrayList<BorrowDTO>(); 
		try {
			// 실행 준비 단계
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setInt(2, (pageNumber - 1) * 10);
			// 실행 결과를 rs에 담기
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BorrowDTO borrow = new BorrowDTO();
				borrow.setUserID(rs.getString(2));
				borrow.setBookTitle(rs.getString(3));
				borrow.setBorrowDate(rs.getString(4));
				borrow.setBorrowTime(rs.getString(5));
				borrow.setReturnDate(rs.getString(6));
				list.add(borrow);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		//다음 페이지가 있는지 확인하는 메소드
		String SQL = "select count(*) from borrow;";
		try {
			// 실행 준비 단계
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			// 실행 결과를 rs에 담기
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int count = rs.getInt(1);
				if (count >= ((pageNumber - 1) * 10) + 1) {
					return true;
				}
			}
		} catch (Exception e) {
			System.out.print(e);
		}
		return false;
	}
}
