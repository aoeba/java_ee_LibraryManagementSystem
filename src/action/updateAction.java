package action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.UniversalUser;
import lmsDB.Comdb;

public class updateAction extends ActionSupport{
	private String newPwd;
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	public String execute() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		UniversalUser user=(UniversalUser) session.getAttribute("u_user");
		int user_id=user.getId();
		System.out.println(newPwd);
		String sql="update user set password='"+newPwd+"' where user_id="+user_id;
		if(Comdb.connection!=null)
		Comdb.getConn();
		Comdb.update(sql, null);
		return SUCCESS;
	}
}
