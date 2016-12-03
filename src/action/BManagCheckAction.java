package action;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lmsDB.BorrowListDB;
import lmsDB.Comdb;

import org.apache.struts2.ServletActionContext;

import bean.BorrowList;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BManagCheckAction extends ActionSupport{

	private String bmchecktype;
	private String checkinfoString;

	public String getBmchecktype() {
		return bmchecktype;
	}
	public void setBmchecktype(String bmchecktype) {
		this.bmchecktype = bmchecktype;
	}
	public String getCheckinfoString() {
		return checkinfoString;
	}
	public void setCheckinfoString(String checkinfoString) {
		this.checkinfoString = checkinfoString;
	}
	@Override
	public String execute() throws Exception {
		if(Comdb.connection==null){
			Comdb.getConn();
		}
		System.out.println(bmchecktype);
		System.out.println(checkinfoString);
		ArrayList<BorrowList> bmchecklist=new ArrayList<BorrowList>();
		String sql="select * from borrow_list where "+bmchecktype+"="+checkinfoString;
		if(bmchecktype.equals("lend_time")){
			sql="select * from borrow_list where "+bmchecktype+" like '%"+checkinfoString+"%'";
		}
		ResultSet rs= Comdb.select(sql, null);
		while(rs.next()){
			BorrowList bList=new BorrowList();
			int id=rs.getInt("id");
			int book_id=rs.getInt("book_id");
			int user_id=rs.getInt("user_id");
			Date lend_time=rs.getDate("lend_time");
			Date back_time=rs.getDate("back_time");
			int manager_id=rs.getInt("manager_id");
			int back_stat=rs.getInt("back_stat");
			bList.setId(id);
			System.out.println(".........."+rs.getInt("book_id"));
			bList.setBacktime(back_time);
			bList.setLendtime(lend_time);
			bList.setBookid(book_id);
			bList.setManagerid(manager_id);
			bList.setUserid(user_id);
			bList.setBackstat(back_stat);
			bmchecklist.add(bList);
		}
		ActionContext.getContext().getSession().put("bmchecklist", bmchecklist);
		ServletActionContext.getResponse().sendRedirect("manager.jsp");
//		return SUCCESS;
		return null;
	}

	public String uncheck() throws Exception {
		System.out.println("hoho");
		if(Comdb.connection==null){
			Comdb.getConn();
		}
		ArrayList<BorrowList> bmunchecklist=new ArrayList<BorrowList>();
		String sql="select * from borrow_list where back_stat=0 or back_stat=2";
		ResultSet rs= Comdb.select(sql, null);
		while(rs.next()){
			BorrowList bList=new BorrowList();
			int id=rs.getInt("id");
			int book_id=rs.getInt("book_id");
			int user_id=rs.getInt("user_id");
			Date lend_time=rs.getDate("lend_time");
			Date back_time=rs.getDate("back_time");
			int manager_id=rs.getInt("manager_id");
			int back_stat=rs.getInt("back_stat");
			bList.setId(id);
			System.out.println(".........."+rs.getInt("id"));
			bList.setBacktime(back_time);
			bList.setLendtime(lend_time);
			bList.setBookid(book_id);
			bList.setManagerid(manager_id);
			bList.setUserid(user_id);
			bList.setBackstat(back_stat);
			bmunchecklist.add(bList);
		}
		ActionContext.getContext().getSession().put("bmchecklist", bmunchecklist);
		ServletActionContext.getResponse().sendRedirect("manager.jsp");
//		return SUCCESS;
		return null;
	}
	public String allcheck() throws Exception {
		if(Comdb.connection==null){
			Comdb.getConn();
		}
		BorrowListDB bListDB = new BorrowListDB();
		ArrayList<BorrowList> bmallchecklist = bListDB.queryBList();
		ActionContext.getContext().getSession().put("bmchecklist", bmallchecklist);
		ServletActionContext.getResponse().sendRedirect("manager.jsp");
//		return SUCCESS;
		return null;
	}
}
