package my.student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO { //Data Access Object => CRUD
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	String url, user, pass;
	
	public StudentDAO() { // jsp파일-> 경로가 다른 곳에서 사용할 것이므로 반드시 '퍼블릭' 생성자를 만들어야 함.
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			System.err.println("오라클 드라이버 검색 실패!!");
		}
		
		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "bigdata02";
		pass = "bigdata02";
	}
	
	public int insertStudent(String id, String name, String cname) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass); //생성자 안에 선언된 변수를 사용 (객체를 만든 후 이 메소드 호출하므로 사용 가능)
			String sql = "insert into student values(?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, cname);
			int res = ps.executeUpdate();
			return res;
		}finally { //예외전가 해줬음에도 finally 쓴 이유 / 멀티스레드로 현재 실행중인 프로그램에 영향 주지 않게 db닫아주기 위해서
			if (ps != null) ps.close(); // null이 아니라면 db가 닫히지 않은 것이므로 닫아주기
			if (con != null) con.close();
		}
	}
	
	public int deleteStudent(String id) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "delete from student where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List<StudentDTO> listStudent() throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from student";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<StudentDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List<StudentDTO> findStudent(String str) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from student where name=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, str);
			rs = ps.executeQuery();
			List<StudentDTO> list = makeList(rs);
			return list;
			
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List<StudentDTO> makeList(ResultSet rs) throws SQLException{
		List<StudentDTO> list = new ArrayList<>();
		while(rs.next()) {
			String id = rs.getString("id");
			String name = rs.getString("name");
			String cname = rs.getString("cname");
			
			StudentDTO dto = new StudentDTO();
			dto.setId(id);
			dto.setName(name);
			dto.setCname(cname);
			list.add(dto);
		}
		return list;
	}
}
