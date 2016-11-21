package lmsDB;

import java.sql.ResultSet;

import bean.BookAdmn;
import bean.SysAdmin;
import bean.User;

public class SysManageDB extends Comdb {

	public Object getInfoByIdAndType(int user_id, int user_type) {
		Object user_info = null;
		String sql = null;
		if (user_type == 1) {
			sql = "select * from user where user_id=" + user_id;
		}
		if (user_type == 2) {
			sql = "select * from book_admin where manager_id=" + user_id;
		}
		if (user_type == 3) {
			sql = "select * from sys_admin where manager_id=" + user_id;
		}
		try {
			if (Comdb.connection == null)
				getConn();
			ResultSet resultSet = select(sql, null);
			if (user_type == 1) {
				while(resultSet.next()){
					User user = new User();
					user.setUser_id(user_id);
					user.setUser_name(resultSet.getString("user_name"));
					user.setPassword(resultSet.getString("password"));
				}
			}
			if (user_type == 2) {
				user_info = new BookAdmn();
			}
			if (user_type == 3) {
				user_info = new SysAdmin();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user_info;
	}
}
