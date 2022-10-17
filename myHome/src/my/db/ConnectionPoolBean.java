package my.db;
import java.sql.*;
import java.util.*;
public class ConnectionPoolBean {
	private String url, user, pass;
	private Hashtable<Connection, Boolean> ht;
	private int increment;
	
	public ConnectionPoolBean() throws ClassNotFoundException, SQLException {
		increment = 3;
		ht = new Hashtable<Connection, Boolean>(5);
		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "bigdata02";
		pass = "bigdata02";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		for(int i=0; i<5; ++i){
			Connection con = DriverManager.getConnection(url, user, pass);
			ht.put(con, Boolean.FALSE);
		}
	}
	
	public synchronized Connection getConnection() throws SQLException {
		Enumeration<Connection> enkey = ht.keys();
		Connection con = null;
		while(enkey.hasMoreElements()){
			con = enkey.nextElement();
			Boolean b = ht.get(con);
			if (b == Boolean.FALSE){
				ht.put(con, Boolean.TRUE);
				return con;
			}
		}
		for(int i=0; i<increment; ++i){
			Connection con2 = DriverManager.getConnection(url, user, pass);
			ht.put(con2, Boolean.FALSE);
		}
		return getConnection();
	}
	
	public void returnConnection(Connection returnCon) throws SQLException{
		Connection con = null;
		Enumeration<Connection> enkey = ht.keys();
		while(enkey.hasMoreElements()){
			con = enkey.nextElement();
			if (returnCon == con) {
				ht.put(con, Boolean.FALSE);
				break;
			}
		}
		removeCon();
	}
	
	public void removeCon() throws SQLException {
		int count =0 ;
		Connection con = null;
		Enumeration<Connection> enkey = ht.keys();
		while(enkey.hasMoreElements()){
			con = enkey.nextElement();
			Boolean b = ht.get(con);
			if(b == Boolean.FALSE){
				count++;
				if(count>5){
					ht.remove(con);
					con.close();
				}
			}
		}
	}
	
	public void closeAll() throws SQLException {
		Connection con = null;
		Enumeration<Connection> enkey = ht.keys();
		while(enkey.hasMoreElements()){
			con = enkey.nextElement();
			con.close();
		}
	}
}









