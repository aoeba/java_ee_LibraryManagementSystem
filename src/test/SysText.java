package test;

import java.util.ArrayList;

import bean.BookAdmn;
import lmsDB.SysManageDB;

public class SysText {
	public static void main(String[] args) {
		ArrayList<BookAdmn> bookAdmns = SysManageDB.getAllBookAdmin();
		System.out.println(bookAdmns.size());
	}
}
