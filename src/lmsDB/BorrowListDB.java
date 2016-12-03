package lmsDB;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import bean.BorrowList;

public class BorrowListDB extends Comdb{
	public ArrayList<BorrowList> queryBList(){
		String sql=null;
		
//		HashMap<String, BorrowList> map=new HashMap<String, BorrowList>();
		ArrayList<BorrowList> bmlist=new ArrayList<BorrowList>();
		ResultSet rSet=null;
		sql="select * from borrow_list";
		try {
			getConn();
			rSet=select(sql, null);
			while(rSet.next()){
				BorrowList bList=new BorrowList();
				int id=rSet.getInt("id");
				int book_id=rSet.getInt("book_id");
				int user_id=rSet.getInt("user_id");
				Date lend_time=rSet.getDate("lend_time");
				Date back_time=rSet.getDate("back_time");
				int manager_id=rSet.getInt("manager_id");
				int back_stat=rSet.getInt("back_stat");
				bList.setId(id);
				bList.setBacktime(back_time);
				bList.setLendtime(lend_time);
				bList.setBookid(book_id);
				bList.setManagerid(manager_id);
				bList.setUserid(user_id);
				bList.setBackstat(back_stat);
				bmlist.add(bList);
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		return bmlist;
	}
	
}
