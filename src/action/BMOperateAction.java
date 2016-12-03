package action;

import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;





import lmsDB.Comdb;

import org.apache.struts2.ServletActionContext;

import bean.Book;

import com.opensymphony.xwork2.ActionSupport;

public class BMOperateAction extends ActionSupport{

	@Override
	public String execute() throws Exception {
		if(Comdb.connection==null){
			Comdb.getConn();
		}
		int stock=0;
		int blcount=0;
		HttpServletRequest request=ServletActionContext.getRequest();
		String bookid=request.getParameter("bookid");
		String managerid=request.getParameter("managerid");
		String id=request.getParameter("id");
		String sql="select stock from book where book_id="+bookid;
		ResultSet rs= Comdb.select(sql, null);
		while(rs.next()){
			stock=rs.getInt("stock");
			System.out.println(stock);
		}
		String sql1="select count(*) as blcount from borrow_list where book_id="+bookid+" and (back_stat=1 or back_stat=2)";
		ResultSet rs1= Comdb.select(sql1, null);
		while(rs1.next()){
			blcount=rs1.getInt("blcount");
			System.out.println(blcount);
		}
		if(stock>blcount){
			String sql2="update borrow_list set back_stat=1,manager_id="+managerid+" where id="+id;
			System.out.println(managerid);
			System.out.println(id);
			Comdb.update(sql2, null);
			ServletActionContext.getResponse().sendRedirect("manager.jsp?operateback=1");
			System.out.println("!!");
		}else{
			ServletActionContext.getResponse().sendRedirect("manager.jsp?operateback=0");
			System.out.println("??");
		}
		return null;
	}
	public String backoperate() throws Exception {
		HttpServletRequest request=ServletActionContext.getRequest();
		String id=request.getParameter("id");
		String managerid=request.getParameter("managerid");
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		String backtime=format.format(date);
		String sql="update borrow_list set back_stat=3,manager_id="+managerid+",back_time='"+backtime+"' where id="+id;
		Comdb.update(sql, null);
		ServletActionContext.getResponse().sendRedirect("manager.jsp?operateback=2");
		return null;
	}

}
