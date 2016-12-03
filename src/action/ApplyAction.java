package action;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ResolverUtil.IsA;

import lmsDB.Comdb;

public class ApplyAction extends ActionSupport{
	public int id2=0;
	public String execute() throws Exception{
		if(Comdb.connection!=null)
		Comdb.getConn();
		HttpServletRequest request=ServletActionContext.getRequest();
		String user_id=request.getParameter("user_id");
		String book_id=request.getParameter("book_id");
		String sql1="select max(id) from borrow_list";
		ResultSet set= Comdb.select(sql1, null);
		while(set.next()){
			String aString=set.getString("max(id)");
			System.out.println(aString);
			id2=1+Integer.parseInt(aString);
			Date ca=Calendar.getInstance().getTime();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd-hh-mm");
			String sql="INSERT INTO borrow_list VALUES(?,?,?,?,?,?,?)";
			String id1=String.valueOf(id2);
			String time=sdf.format(ca);
			String[] strings={id1,time,null,user_id,"0",book_id,"0"};
			Comdb.update(sql, strings);
		}
		return SUCCESS;
	}
}
