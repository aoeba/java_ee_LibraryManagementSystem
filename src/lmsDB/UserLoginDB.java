package lmsDB;

import java.sql.ResultSet;

import bean.UniversalUser;

public class UserLoginDB extends Comdb {

	public static boolean getLoginResult(UniversalUser user){
		String sql=null;
		boolean isLogin=false;
		if(user.getType()==1){
			sql="select password,user_name from user where user_id="+user.getId();
		}
		if(user.getType()==2){
			sql="select password,manager_name from book_admin where manager_id="+user.getId();
		}
		if(user.getType()==3){
			sql="select password,manager_name from sys_admin where manager_id="+user.getId();
		}
		try {
			getConn();
			ResultSet resultSet=select(sql, null);
			while(resultSet.next()){
				String password=resultSet.getString("password");
				if(user.getPassword().equals(password)){
					isLogin=true;
					if(user.getType()==1){
						user.setName(resultSet.getString("user_name"));
					}else
						user.setName(resultSet.getString("manager_name"));
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isLogin;
	}
}
