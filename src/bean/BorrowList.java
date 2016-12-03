package bean;

import java.util.Date;

public class BorrowList {
	private int id;
	private Date lendtime;
	private Date backtime;
	private int userid;
	private int managerid;
	private int bookid;
	private int backstat;
	public int getBackstat() {
		return backstat;
	}
	public void setBackstat(int backstat) {
		this.backstat = backstat;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getLendtime() {
		return lendtime;
	}
	public void setLendtime(Date lendtime) {
		this.lendtime = lendtime;
	}
	public Date getBacktime() {
		return backtime;
	}
	public void setBacktime(Date backtime) {
		this.backtime = backtime;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getManagerid() {
		return managerid;
	}
	public void setManagerid(int managerid) {
		this.managerid = managerid;
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
}
