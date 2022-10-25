package memo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;

public class MemoDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private String url, user, pass;
	
	public MemoDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "bigdata02";
		pass = "bigdata02";
		
	}
	
	public int insertMemo(MemoDTO dto) {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "insert into memo values(?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getContents());
			int res = ps.executeUpdate();
			return res;
		}catch(SQLException e) {
			System.out.println("insert 실행 중 오류 발생!!");
			e.printStackTrace();
		}finally {
			try {
				if (ps != null) ps.close();
				if (con != null) con.close();
			}catch(SQLException e) {}
		}
		return 0;
	}
	
	public List<MemoDTO> listMemo() {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from memo";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<MemoDTO> list = new ArrayList<>();
			while(rs.next()) {
				MemoDTO dto = new MemoDTO();
				dto.setId(rs.getString("id"));
				dto.setEmail(rs.getString("email"));
				dto.setContents(rs.getString("contents"));
				list.add(dto);
			}
			return list;
		}catch(SQLException e) {
			System.out.println("list 실행 중 오류 발생!!");
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			}catch(SQLException e) {}
		}
		return null;
	}
}









