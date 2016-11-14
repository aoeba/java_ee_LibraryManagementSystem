package interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

import bean.UniversalUser;

public class LoginInterceptor implements Interceptor{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		UniversalUser u_user=(UniversalUser) ActionContext.getContext().getSession().get("u_user");
		if(u_user==null){
			HttpServletRequest request=ServletActionContext.getRequest();
			String path=request.getRequestURI().substring(33);
			String queryString=request.getQueryString();
			if(queryString==null){
				queryString="";
			}
			String realPath=path+"?"+queryString;
			//String realPath=path;
			request.getSession().setAttribute("prePage", realPath);
			arg0.invokeActionOnly();
		}
		return "index";
	}

}
