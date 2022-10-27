package student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*; //Context와 InitialContext가 들어있는 클래스
import javax.sql.DataSource;
public class StudentDAO {	//Data Access Object => CRUD
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	//server.xml; 최하단에 Resource 변경
	private static DataSource ds; //서버가 만들어지면 미리
	static { // 리소스 패키지 연결
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle"); // 경로/경로/이름/이름 => 이미 만들어진 ds와 연결완료
		}catch(NamingException e) {
			e.printStackTrace();
		}
		
	}
	
	public StudentDAO() {}
	
	public int insertStudent(StudentDTO dto) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "insert into student values(?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getCname());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int deleteStudent(String id) throws SQLException {
		try {
			con = ds.getConnection();
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
			con = ds.getConnection();
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
	
	public List<StudentDTO> findStudent(String name) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "select * from student where name=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
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









