package lmsDB;

import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.mysql.jdbc.Connection;

public class Comdb {

	public static Connection connection;
//	private Comdb(){
//		//私有构造方法，禁止实例化
//	}
	public static void getConn() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		InputStream is=Comdb.class.getResourceAsStream("db.properties");
		Properties properties=new Properties();
		properties.load(is);
		String url = properties.getProperty("url");
		String user = properties.getProperty("user");
		String password = properties.getProperty("password");
		connection=(Connection) DriverManager.getConnection(url, user, password);
	}
	
	public static ResultSet select(String sql,String[] strings) throws SQLException{
		PreparedStatement preparedStatement=connection.prepareStatement(sql);
		if(strings!=null){
			for(int i=1;i<=strings.length;i++)
				preparedStatement.setString(i, strings[i-1]);
		}
		ResultSet resultSet=preparedStatement.executeQuery();
		return resultSet;
	}
	
	public static boolean update(String sql,String[] strings) throws SQLException{
		PreparedStatement preparedStatement=connection.prepareStatement(sql);
		if(strings!=null){
			for(int i=1;i<=strings.length;i++)
				preparedStatement.setString(i, strings[i-1]);
		}
		boolean b=preparedStatement.execute();
		return b;
	}
}
