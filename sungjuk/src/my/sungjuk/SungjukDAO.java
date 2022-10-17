package my.sungjuk;

import java.sql.*;
import java.util.*;

public class SungjukDAO {
	Connection con; //db����� 1
	PreparedStatement ps; //����������
	ResultSet rs; //(select)�����
	
	String url, user, pass; //db�����2
	
	private String search;
	private String searchString;
	
	
	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getSearchString() {
		return searchString;
	}

	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	public SungjukDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			//System.err.println("����Ŭ ����̹� �˻� ����!!");
			//System.out.println(e.getMessage());
			e.printStackTrace(); //e.getMessage + ���ÿ� ���ִ� ���ϵ��� ��� �����ش�.(���� �ڵ��� ������ ���� ����ã��)
		}
		
		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "bigdata02";
		pass = "bigdata02";
	}
	
	public int insertMember(SungjukDTO dto) throws SQLException {
		try{
			con = DriverManager.getConnection(url, user, pass);
			String sql = "insert into sungjuk values(sungjuk_seq.nextval, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getCname());
			ps.setInt(3, dto.getKor());
			ps.setInt(4, dto.getEng());
			ps.setInt(5, dto.getMath());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}			
	}
	
	public List<SungjukDTO> listSungjuk() throws SQLException{
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from sungjuk";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			List<SungjukDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List<SungjukDTO> makeList(ResultSet rs) throws SQLException{
		List<SungjukDTO> list = new ArrayList<>();
		while(rs.next()) {
			SungjukDTO dto = new SungjukDTO();
			dto.setNo(rs.getInt("no"));
			dto.setName(rs.getString("name"));
			dto.setCname(rs.getString("cname"));
			dto.setKor(rs.getInt("kor"));
			dto.setEng(rs.getInt("eng"));
			dto.setMath(rs.getInt("math"));
			list.add(dto);
		}
		return list;
	}
	
	public List<SungjukDTO> findSungjuk() throws SQLException{
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from sungjuk where " + search + "=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, searchString);
			rs = ps.executeQuery();

			List<SungjukDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	

}
