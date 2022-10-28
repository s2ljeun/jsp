package board.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.dto.BoardDTO;

public class BoardDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	private static DataSource ds;
	static {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	public BoardDAO() {
	}
	
	public List<BoardDTO> listBoard(int start, int end) throws SQLException {
		try {
			con = ds.getConnection();
			String sql  = "select * from (select rownum rn, A.* from "
					+ "(select * from board order by re_step asc)A) "
					+ "where rn between ? and ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			List<BoardDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List<BoardDTO> makeList(ResultSet rs) throws SQLException {
		List<BoardDTO> list = new ArrayList<>();
		while(rs.next()) {
			BoardDTO dto = new BoardDTO();
			dto.setNum(rs.getInt("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setEmail(rs.getString("email"));
			dto.setSubject(rs.getString("subject"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setContent(rs.getString("content"));
			dto.setIp(rs.getString("ip"));
			dto.setRe_step(rs.getInt("re_step"));
			dto.setRe_level(rs.getInt("re_level"));
			list.add(dto);
		}
		return list;
	}
	
	public int insertBoard(BoardDTO dto) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = null;
			if (dto.getNum() == 0) {
				sql = "update board set re_step = re_step + 1";
				dto.setRe_step(0);
				dto.setRe_level(0);
			}else {
				sql = "update board set re_step = re_step + 1 where re_step>"+dto.getRe_step();
				dto.setRe_step(dto.getRe_step() + 1);
				dto.setRe_level(dto.getRe_level() + 1);
			}
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			
			sql = "insert into board values(board_seq.nextval, ?,?,?,?,sysdate,0,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getSubject());
			ps.setString(4, dto.getPasswd());
			ps.setString(5, dto.getContent());
			ps.setString(6, dto.getIp());
			ps.setInt(7, dto.getRe_step());
			ps.setInt(8, dto.getRe_level());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public void plusReadcount(int num) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "update board set readcount = readcount + 1 where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			int res = ps.executeUpdate();			
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public BoardDTO getBoard(int num, String mode) throws SQLException {
		if (mode.equals("content")) {
			plusReadcount(num);
		}
		try {
			con = ds.getConnection();
			String sql = "select * from board where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			List<BoardDTO> list = makeList(rs);
			return list.get(0);
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int deleteBoard(int num, String passwd) throws SQLException {
		try {
			BoardDTO dto = getBoard(num, "password");
			if (dto.getPasswd().equals(passwd)) {
				con = ds.getConnection();
				String sql = "delete from board where num = ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, num);
				int res = ps.executeUpdate();
				return res;	//삭제가 되면 삭제갯수가, 삭제가 안되면 0이 리턴....
			}else {
				return -1;	//비밀번호가 틀렸을땐 삭제가 안되게 하겠다
			}
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int updateBoard(BoardDTO dto) throws SQLException {
		try {
			BoardDTO dto2 = getBoard(dto.getNum(), "password");
			if (dto2.getPasswd().equals(dto.getPasswd())) {
				con = ds.getConnection();
				String sql = "update board set subject=?, email=?, content=? where num = ?";
				ps = con.prepareStatement(sql);
				ps.setString(1, dto.getSubject());
				ps.setString(2, dto.getEmail());
				ps.setString(3, dto.getContent());
				ps.setInt(4, dto.getNum());
				int res = ps.executeUpdate();
				return res;	
		}else {
				return -1;	
			}
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int getCount() throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "select count(*) from board";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}















