package action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import bean.UniversalUser;
import lmsDB.UserLoginDB;

public class LoginAction extends ActionSupport{
	private UniversalUser u_user;
	private String prePage;

	public String getPrePage() {
		return prePage;
	}


	public void setPrePage(String prePage) {
		this.prePage = prePage;
	}


	public UniversalUser getU_user() {
		return u_user;
	}


	public void setU_user(UniversalUser u_user) {
		this.u_user = u_user;
	}


	@Override
	public String execute() throws Exception {
		System.out.println(u_user.getId()+" "+u_user.getType());
		ActionContext.getContext().getSession().put("u_user", u_user);
		prePage=(String) ActionContext.getContext().getSession().get("prePage");
		System.out.println(prePage);
		return ActionSupport.SUCCESS;
		
		//return null;
	}
	
	public String login() throws IOException{
		if(UserLoginDB.getLoginResult(u_user)){
			ActionContext.getContext().getSession().put("u_user", u_user);
			if(prePage!=null){
				HttpServletResponse response = ServletActionContext.getResponse();
				response.sendRedirect(prePage); 
			}else
				return "success";
		}
		return "error";
	}
}
