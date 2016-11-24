package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.struts2.ServletActionContext;

import bean.Book;
import bean.BookAdmn;
import bean.Type;
import bean.User;
import lmsDB.SysManageDB;
import net.sf.json.JSONArray;

public class SysAction {
	

	public String reset() {
		String request_type = ServletActionContext.getRequest().getParameter("type");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		if (request_type.equals("1")) {
			return "sysadmin";
		}
		if (request_type.equals("2")) {
			ArrayList<User> users = SysManageDB.getAllUser();
			try {
				ServletActionContext.getResponse().getWriter().write(JSONArray.fromObject(users).toString());
			} catch (IOException e) {
				System.out.println(request_type+"write error");
			}
		}
		if (request_type.equals("3")) {
			ArrayList<BookAdmn> bookAdmns = SysManageDB.getAllBookAdmin();
			System.out.println(bookAdmns.get(0).getId());
			try {
				ServletActionContext.getResponse().getWriter().write(JSONArray.fromObject(bookAdmns).toString());
			} catch (IOException e) {
				System.out.println(request_type+"write error");
			}
		}
		if (request_type.equals("4")) {
			ArrayList<Type> types = SysManageDB.getAllType();
			try {
				ServletActionContext.getResponse().getWriter().write(JSONArray.fromObject(types).toString());
			} catch (IOException e) {
				System.out.println(request_type+"write error");
			}
		}
		if (request_type.equals("5")) {
			ArrayList<Book> books = SysManageDB.getAllBook();
			try {
				ServletActionContext.getResponse().getWriter().write(JSONArray.fromObject(books).toString());
			} catch (IOException e) {
				System.out.println(request_type+"write error");
			}
		}

		return null;
	}
}
