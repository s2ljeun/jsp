package shop.dao;

import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import shop.dto.ProductDTO;

import java.sql.*;

public class ProductList {
	Hashtable<String, List<ProductDTO>> ht;

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
	
	public ProductList() {
		ht = new Hashtable<>();
	}
	
	public List<ProductDTO> makeList(ResultSet rs) throws SQLException {
		List<ProductDTO> list = new ArrayList<>();
		while(rs.next()) {
			ProductDTO dto = new ProductDTO();
			dto.setPnum(rs.getInt("pnum"));
			dto.setPname(rs.getString("pname"));
			dto.setPcategory_fk(rs.getString("pcategory_fk"));
			dto.setPcompany(rs.getString("pcompany"));
			dto.setPimage(rs.getString("pimage"));
			dto.setPqty(rs.getInt("pqty"));
			dto.setPrice(rs.getInt("price"));
			dto.setPspec(rs.getString("pspec"));
			dto.setPcontents(rs.getString("pcontents"));
			dto.setPoint(rs.getInt("point"));
			dto.setPinputdate(rs.getString("pinputdate"));
			list.add(dto);
		}
		return list;
	}
	
	public List<ProductDTO> selectBySpec(String pspec) throws SQLException {
		if (ht.containsKey(pspec)) {
			return ht.get(pspec);
		}
		try {
			con = ds.getConnection();
			String sql = "select * from product where pspec = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, pspec);
			rs = ps.executeQuery();
			List<ProductDTO> list = makeList(rs);
			ht.put(pspec, list);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	public List<ProductDTO> selectByCode(String code) throws SQLException {
		if (ht.containsKey(code)) {
			return ht.get(code);
		}
		try {
			con = ds.getConnection();
			String sql = "select * from product where pcategory_fk like ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, code+"%");
			rs = ps.executeQuery();
			List<ProductDTO> list = makeList(rs);
			ht.put(code, list);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public ProductDTO getProduct(int pnum, String select) {
		List<ProductDTO> list = ht.get(select);
		for(ProductDTO dto : list) {
			if (pnum == dto.getPnum()) {
				return dto;
			}
		}
		return null;
	}
}











