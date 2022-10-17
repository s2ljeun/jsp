package my.sungjuk;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SungjukDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	String url, user, pass;
	
	public SungjukDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "bigdata02";
		pass = "bigdata02";
	}
	
	public List<SungjukDTO> listSungjuk() throws SQLException {
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
	
	public List<SungjukDTO> makeList(ResultSet rs) throws SQLException {
		List<SungjukDTO> list = new ArrayList<>();
		while(rs.next()) {
			SungjukDTO dto = new SungjukDTO();
			dto.setNum(rs.getInt("num"));
			dto.setName(rs.getString("name"));
			dto.setCname(rs.getString("cname"));
			dto.setKor(rs.getInt("kor"));
			dto.setEng(rs.getInt("eng"));
			dto.setMat(rs.getInt("mat"));
			dto.setTot();
			list.add(dto);
		}
		//순위구하기
		for(SungjukDTO sj : list) {
			sj.clearRank();
			for(SungjukDTO sj2 : list) {
				if (sj.getTot() < sj2.getTot()) {
					sj.plusRank();
				}
			}
		}
		return list;		
	}
	
	public int insertSungjuk(SungjukDTO dto) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "insert into sungjuk values(sungjuk_seq.nextval, ?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getCname());
			ps.setInt(3, dto.getKor());
			ps.setInt(4, dto.getEng());
			ps.setInt(5, dto.getMat());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int deleteSungjuk(int  num) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "delete from sungjuk where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public SungjukDTO getSungjuk(int num) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from sungjuk where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			List<SungjukDTO> list = makeList(rs);
			return list.get(0);
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int updateSungjuk(SungjukDTO dto) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "update sungjuk set kor=?, eng=?, mat=? where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getKor());
			ps.setInt(2, dto.getEng());
			ps.setInt(3, dto.getMat());
			ps.setInt(4, dto.getNum());
			int res = ps.executeUpdate();
			return res;
		}finally{
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List<SungjukDTO> findSungjuk(String search, String searchString) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from sungjuk where " + search +" = ?";
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












