package user;

import db.Config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
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
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword))
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 불일치
			}
			
			return -1; // 아이디가 없음
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -2; // 데이터베이스 오류
	}

	public int join(UserDTO user) {
		String SQL="insert into user values (?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserEmail());
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("ȸ�������ϴ� ��񿡼� ���� �߻� : "+e);
		}
		
		return -1;
		// 데이터베이스 오류
	}
}
