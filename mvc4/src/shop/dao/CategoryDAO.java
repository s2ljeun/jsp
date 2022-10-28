package shop.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import shop.dto.CategoryDTO;

public class CategoryDAO {
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

	public CategoryDAO() {
	}
	
	public int insertCate(CategoryDTO dto) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "insert into category values(cate_seq.nextval, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getCode());
			ps.setString(2, dto.getCname());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List<CategoryDTO> listCate() throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "select * from category order by cnum";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<CategoryDTO> list = new ArrayList<>();
			while(rs.next()) {
				CategoryDTO dto = new CategoryDTO();
				dto.setCnum(rs.getInt("cnum"));
				dto.setCode(rs.getString("code"));
				dto.setCname(rs.getString("cname"));
				list.add(dto);
			}
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int deleteCate(int cnum) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "delete from category where cnum = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, cnum);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}













