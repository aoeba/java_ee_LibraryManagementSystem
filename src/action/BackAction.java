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
		if(Comdb.connection!=null)
		Comdb.getConn();
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		Date ca=Calendar.getInstance().getTime();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd-hh-mm");
		String time=sdf.format(ca);
		String sql="update borrow_list set BACK_TIME='"+time+"'"+",back_stat=3 where ID="+id;
		boolean f= Comdb.update(sql, null);
		if(f=false)
			return ERROR;
		return SUCCESS;
	} 
}
