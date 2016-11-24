package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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
	private File upload;
	private String uploadFileName;
	private String tableType;

	public String getTableType() {
		return tableType;
	}

	public void setTableType(String tableType) {
		this.tableType = tableType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

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
				System.out.println(request_type + "write error");
			}
		}
		if (request_type.equals("3")) {
			ArrayList<BookAdmn> bookAdmns = SysManageDB.getAllBookAdmin();
			System.out.println(bookAdmns.get(0).getId());
			try {
				ServletActionContext.getResponse().getWriter().write(JSONArray.fromObject(bookAdmns).toString());
			} catch (IOException e) {
				System.out.println(request_type + "write error");
			}
		}
		if (request_type.equals("4")) {
			ArrayList<Type> types = SysManageDB.getAllType();
			try {
				ServletActionContext.getResponse().getWriter().write(JSONArray.fromObject(types).toString());
			} catch (IOException e) {
				System.out.println(request_type + "write error");
			}
		}
		if (request_type.equals("5")) {
			ArrayList<Book> books = SysManageDB.getAllBook();
			try {
				ServletActionContext.getResponse().getWriter().write(JSONArray.fromObject(books).toString());
			} catch (IOException e) {
				System.out.println(request_type + "write error");
			}
		}

		return null;
	}

	/**
	 * @tableType 1:'普通用户表',2:'图书管理员表',3:'系统管理员表',4:'科目表',5:'图书表'
	 * @return
	 */
	public String updateDB(){
		FileInputStream fis;
		if(getUpload()!=null){
			System.out.println("来了..."+tableType);
			try {
				fis=new FileInputStream(getUpload());
				ArrayList<String> errors=SysManageDB.AddInfoByTxt(fis, Integer.parseInt(tableType));
				ServletActionContext.getRequest().getSession().setAttribute("errors", errors);
			} catch (FileNotFoundException e) {
				System.out.println("文件读取流获取失败失败");
			}
				
		}
		

	return"success";
	}

}
