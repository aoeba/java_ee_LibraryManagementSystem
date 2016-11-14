package action;

import com.opensymphony.xwork2.ActionSupport;

import bean.UniversalUser;

public class LoginAction extends ActionSupport{
	private UniversalUser u_user;
	

	public UniversalUser getU_user() {
		return u_user;
	}


	public void setU_user(UniversalUser u_user) {
		this.u_user = u_user;
	}


	@Override
	public String execute() throws Exception {
		System.out.println(u_user.getId()+" "+u_user.getType());
		return ActionSupport.SUCCESS;
	}
}
