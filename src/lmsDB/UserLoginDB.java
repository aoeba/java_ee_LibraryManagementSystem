package lmsDB;

public class UserLoginDB extends Comdb {

	public boolean getLoginResult(int type){
		String sql;
		if(type==1){
			sql="select user_id,password from user";
		}
		if(type==2){
			sql="select manager_id,password from book_admin";
		}
		if(type==3){
			sql="select user_id,password from user";
		}
		return false;
	}
}
