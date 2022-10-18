package my.member;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.db.ConnectionPoolBean;

public class MemberDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	//String url, user, pass;
	
	private String search;
	private String searchString;
	public void setSearch(String search) {
		this.search = search;
	}
	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	private ConnectionPoolBean pool;
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public MemberDAO() {
		/*
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			//System.out.println(e.getMessage());
			e.printStackTrace();
		}
		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "bigdata02";
		pass = "bigdata02";
		*/
	}
	
	public boolean checkMember(String name, String ssn1, String ssn2) throws SQLException {
		try {
			//con = DriverManager.getConnection(url, user, pass);
			con = pool.getConnection();
			String sql = "select * from jsp_member where ssn1=? and ssn2=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, ssn1);
			ps.setString(2, ssn2);
			rs = ps.executeQuery();
			if (rs.next()) return true;
			else return false;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	
	public int insertMember(MemberDTO dto) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "insert into jsp_member values(member_seq.nextval, ?,?,?,?,?,?,?,?,?,sysdate)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPasswd());
			ps.setString(4, dto.getSsn1());
			ps.setString(5, dto.getSsn2());
			ps.setString(6, dto.getEmail());
			ps.setString(7, dto.getHp1());
			ps.setString(8, dto.getHp2());
			ps.setString(9, dto.getHp3());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public List<MemberDTO> listMember() throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "select * from jsp_member";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<MemberDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	protected List<MemberDTO> makeList(ResultSet rs) throws SQLException {
		List<MemberDTO> list = new ArrayList<>();
		while(rs.next()) {
			MemberDTO dto = new MemberDTO();
			dto.setNo(rs.getInt("no"));
			dto.setName(rs.getString("name"));
			dto.setId(rs.getString("id"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setSsn1(rs.getString("ssn1"));
			dto.setSsn2(rs.getString("ssn2"));
			dto.setEmail(rs.getString("email"));
			dto.setHp1(rs.getString("hp1"));
			dto.setHp2(rs.getString("hp2"));
			dto.setHp3(rs.getString("hp3"));
			dto.setJoindate(rs.getString("joindate"));
			list.add(dto);
		}
		return list;
	}
	
	public int deleteMember(int no) throws SQLException{
		try {
			con = pool.getConnection();
			String sql = "delete from jsp_member where no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public MemberDTO getMember(int no) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "select * from jsp_member where no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			List<MemberDTO> list = makeList(rs);
			return list.get(0);
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public MemberDTO getMember(String id) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "select * from jsp_member where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			List<MemberDTO> list = makeList(rs);
			if(list.size()==0) return null;
			return list.get(0);
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	
	public int updateMember(MemberDTO dto) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "update jsp_member set passwd=?, email=?, hp1=?, hp2=?, hp3=? where no = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPasswd());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getHp1());
			ps.setString(4, dto.getHp2());
			ps.setString(5, dto.getHp3());
			ps.setInt(6, dto.getNo());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public List<MemberDTO> findMember() throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "select * from jsp_member where "+search+" = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, searchString);
			rs = ps.executeQuery();
			List<MemberDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public String searchMember(String name, String ssn1, String ssn2, String id) throws SQLException{
		try {
			con = pool.getConnection();
			String sql;
			if(id==null) { //아이디 찾기
				sql = "select id from jsp_member where name=? and ssn1=? and ssn2=?";
			}else { //비밀번호 찾기
				sql = "select passwd from jsp_member where name=? and ssn1=? and ssn2=? and id=?";
			}
			
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, ssn1);
			ps.setString(3, ssn2);
			if(id != null) ps.setString(4, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				String msg = rs.getNString(1);
				if(id==null) {
					msg = "회원님의 아이디는 " + msg + "입니다.";
				}else {
					msg = "회원님의 비밀번호는 " + msg + "입니다.";
				}
				return msg;
			}else {
				return "입력된 데이터와 일치하는 회원이 없습니다.";
			}
			
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
}










