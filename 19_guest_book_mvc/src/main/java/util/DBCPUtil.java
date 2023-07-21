package util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBCPUtil {
	
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup(
					"java:comp/env/java/MySqlDB"
			);
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println("DBCP 이름 정보를 찾을 수 없음.");
		} catch (SQLException e) {
			System.out.println("Connection을 생성 하기 위한 정보가 일치하지 않음");
		}
		return conn;
	}
	
	// JDBC 자원 해제
	public static void close(AutoCloseable... closer) {
		for(AutoCloseable c : closer) {
			if(c != null) {
				try {
					c.close();
				} catch (Exception e) {}
			} // end if
		} // end for
	} // end close
}
