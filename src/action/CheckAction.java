package action;

import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import lmsDB.Comdb;

public class CheckAction extends ActionSupport{
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String checktype() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		int type_id=Integer.parseInt(request.getParameter("type_id"));
		Comdb.getConn();
		String sql="select * from book where type_id="+type_id;
		ResultSet rs= Comdb.select(sql, null);
		if(rs==null) return ERROR;
		session.setAttribute("book", rs);
		return SUCCESS;
	}
	public String execute() throws Exception{

		System.out.println(name);
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		Comdb.getConn();
		String sql="select * from book where book_name like '%"+name+"%'";
		ResultSet rs1= Comdb.select(sql, null);
		if(rs1==null) return ERROR;
		session.setAttribute("book", rs1);
		return SUCCESS;
	}
}
