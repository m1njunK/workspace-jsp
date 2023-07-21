package util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * database Connection Pool 에서
 * Connection 정보를 반환
 */
public class DBCPUtil extends JDBCUtil {
	
	public static Connection getConnection(){
		Connection conn = null;
		// javax.naming.Context
		try {
			// JNDI(Java Naming and Directory Interface)
			// 디렉토리 서비스에서 제공하는 데이터 및 객체를 발견하고 참고 하기 위한
			// 자바 API
			
			// context에 등록된 name 정보로 resource를 저장하고 있는 객체
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:comp/env/java/MySQLDB");
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
}
