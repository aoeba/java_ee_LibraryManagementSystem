package action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import lmsDB.Comdb;

public class BackAction extends ActionSupport{
	public String execute() throws Exception{
		Comdb.getConn();
		HttpServletRequest request=ServletActionContext.getRequest();
		String ID=request.getParameter("ID");
		Date ca=Calendar.getInstance().getTime();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd-hh-mm");
		String time=sdf.format(ca);
		String sql="update borrow_list set BACK_TIME='"+time+"' where ID="+ID;
		Comdb.update(sql, null);
		return SUCCESS;
	} 
}
