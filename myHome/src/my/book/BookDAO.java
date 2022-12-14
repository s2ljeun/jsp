package my.book;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import my.student.StudentDTO;

import java.text.SimpleDateFormat;

public class BookDAO { //Data Access Object => CRUD
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	Date today = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String date = df.format(today);
	
	String url, user, pass;
	
	public BookDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			System.err.println("오라클 드라이버 검색 실패!!");
		}
		
		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "bigdata02";
		pass = "bigdata02";
	}
	
	public int insertBook(String bookname, String writer,
							String publisher, String price) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "insert into jspbook values(?, ?, ?, ?, ?)"; //sysdate <- 오라클 명령어 넣을 수 있음 varchar/date형에 따라 알아서 들어간다.
			ps = con.prepareStatement(sql);
			ps.setString(1, bookname);
			ps.setString(2, writer);
			ps.setString(3, publisher);
			ps.setInt(4, Integer.parseInt(price));
			ps.setString(5, date);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int deleteBook(String bookname) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "delete from jspbook where bookname=?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, bookname);

			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List<BookDTO> listBook() throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from jspbook";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<BookDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List<BookDTO> findBook(String search, String searchString) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from jspbook where   "+search+" = ?";
			//동적쿼리에서는 데이터만 ?로 처리, 컬럼의 이름은 문자열 형태로 입력되어야 한다.
			ps = con.prepareStatement(sql);
			ps.setString(1, searchString);
			rs = ps.executeQuery();
			List<BookDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List<BookDTO> makeList(ResultSet rs) throws SQLException {
		List<BookDTO> list = new ArrayList<>();
		while(rs.next()) {
			BookDTO dto = new BookDTO();
			dto.setBookname(rs.getString("bookname"));
			dto.setWriter(rs.getString("writer"));
			dto.setPublisher(rs.getString("publisher"));
			dto.setPrice(rs.getInt("price"));
			dto.setIndate(rs.getString("indate"));
			list.add(dto);
		}
		return list;
	}
}
