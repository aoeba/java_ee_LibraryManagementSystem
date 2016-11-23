package lmsDB;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.Book;
import bean.BookAdmn;
import bean.SysAdmin;
import bean.Type;
import bean.User;

public class SysManageDB extends Comdb {

	/*
	 * @user_type 1:user;2:book_admin;3:sys_admin
	 */
	public static Object getInfoByIdAndType(int user_id, int user_type) {
		Object user_info = null;
		String sql = null;
		if (user_type == 1) {
			sql = "select * from user where user_id=" + user_id;
		}
		if (user_type == 2) {
			sql = "select * from book_admin where manager_id=" + user_id;
		}
		if (user_type == 3) {
			sql = "select * from sys_admin where manager_id=" + user_id;
		}
		try {
			if (Comdb.connection == null)
				getConn();
			ResultSet resultSet = select(sql, null);
			if (user_type == 1) {
				while (resultSet.next()) {
					User user = new User();
					user.setUser_id(user_id);
					user.setUser_name(resultSet.getString("user_name"));
					user.setPassword(resultSet.getString("password"));
					user.setPhone_number(resultSet.getString("phone_number"));
					user_info = user;
				}
				return user_info;
			}
			if (user_type == 2) {
				while (resultSet.next()) {
					BookAdmn bookAdmn = new BookAdmn();
					bookAdmn.setId(user_id);
					bookAdmn.setIdnumber(Integer.parseInt(resultSet.getString("id_number")));
					bookAdmn.setName(resultSet.getString("manager_id"));
					bookAdmn.setPassword(resultSet.getString("password"));
					bookAdmn.setPhone(resultSet.getString("phone_number"));
					user_info = bookAdmn;
				}
				return user_info;

			}
			if (user_type == 3) {
				while (resultSet.next()) {
					SysAdmin sysAdmin = new SysAdmin();
					sysAdmin.setId_number(Integer.parseInt(resultSet.getString("id_number")));
					sysAdmin.setManager_id(user_id);
					sysAdmin.setManager_name(resultSet.getString("manager_name"));
					sysAdmin.setPassword(resultSet.getString("password"));
					sysAdmin.setPhone_number(resultSet.getString("phone_number"));
					user_info = sysAdmin;
				}
				return user_info;

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user_info;
	}

	public static ArrayList<User> getAllUser() {
		ArrayList<User> users = new ArrayList<>();
		try {
			if (Comdb.connection == null)
				Comdb.getConn();
			String sql = "select * from user";
			ResultSet resultSet = Comdb.select(sql, null);
			while (resultSet.next()) {
				User user = new User();
				user.setUser_id(Integer.parseInt(resultSet.getString("user_id")));
				user.setUser_name(resultSet.getString("user_name"));
				user.setPassword(resultSet.getString("password"));
				user.setPhone_number(resultSet.getString("phone_number"));
				users.add(user);
			}
		} catch (Exception e) {
			users = null;
		}
		return users;
	}

	public static ArrayList<BookAdmn> getAllBookAdmin() {
		ArrayList<BookAdmn> bookAdmns = new ArrayList<>();
		try {
			if (Comdb.connection == null)
				Comdb.getConn();
			String sql = "select * from book_admin";
			ResultSet resultSet = Comdb.select(sql, null);
			while (resultSet.next()) {
				BookAdmn bookAdmn = new BookAdmn();
				bookAdmn.setId(resultSet.getInt("manager_id"));
				bookAdmn.setName(resultSet.getString("manager_name"));
				bookAdmn.setPassword(resultSet.getString("password"));
				bookAdmn.setPhone(resultSet.getString("phone_number"));
				System.out.println("5");
				//bookAdmn.setIdnumber(Integer.parseInt(resultSet.getString("id_number")));
				System.out.println("6");
				bookAdmns.add(bookAdmn);
				System.out.println("password:"+bookAdmn.getPassword());
			}
		} catch (Exception e) {
			//bookAdmns = null;
		}
		return bookAdmns;
	}

	public static ArrayList<SysAdmin> getAllSysAdmin() {
		ArrayList<SysAdmin> sysAdmins = new ArrayList<>();
		try {
			if (Comdb.connection == null)
				Comdb.getConn();
			String sql = "select * from sys_admin";
			ResultSet resultSet = Comdb.select(sql, null);
			while (resultSet.next()) {
				SysAdmin sysAdmin = new SysAdmin();
				sysAdmin.setId_number(Integer.parseInt(resultSet.getString("id_number")));
				sysAdmin.setManager_id(Integer.parseInt(resultSet.getString("manager_id")));
				sysAdmin.setManager_name(resultSet.getString("manager_name"));
				sysAdmin.setPassword(resultSet.getString("password"));
				sysAdmin.setPhone_number(resultSet.getString("phone_number"));
				sysAdmins.add(sysAdmin);
			}
		} catch (Exception e) {
			sysAdmins = null;
		}
		return sysAdmins;
	}
	
	public static ArrayList<Book> getAllBook() {
		ArrayList<Book> books = new ArrayList<>();
		try {
			if (Comdb.connection == null)
				Comdb.getConn();
			String sql = "select * from book";
			ResultSet resultSet = Comdb.select(sql, null);
			while (resultSet.next()) {
				Book book = new Book();
				book.setBook_id(Integer.parseInt(resultSet.getString("book_id")));
				book.setAuthor(resultSet.getString("author"));
				book.setBook_name(resultSet.getString("book_name"));
				book.setPress(resultSet.getString("press"));
				book.setPrice(Float.parseFloat(resultSet.getString("price")));
				book.setPrint_time(resultSet.getString("print_time"));
				book.setRegister_time(resultSet.getString("register_time"));
				book.setStock(resultSet.getInt("stock"));
				book.setType_id(resultSet.getInt("type_id"));
				books.add(book);
			}
		} catch (Exception e) {
			books = null;
		}
		return books;
	}
	
	public static ArrayList<Type> getAllType() {
		ArrayList<Type> types = new ArrayList<>();
		try {
			if (Comdb.connection == null)
				Comdb.getConn();
			String sql = "select * from type";
			ResultSet resultSet = Comdb.select(sql, null);
			while (resultSet.next()) {
				Type type=new Type();
				type.setType_id(resultSet.getString("type_id"));
				type.setType_LibraryRoom(resultSet.getString("type_LibraryRoom"));
				type.setType_name(resultSet.getString("type_name"));
				types.add(type);
			}
		} catch (Exception e) {
			types = null;
		}
		return types;
	}


	/*
	 * @user_type 1:user;2:book_admin;3:sys_admin
	 */
	public static boolean upDateInfoByIdAndType(int user_id, int user_type, String[] strings) {
		boolean b = false;
		String sql = null;
		if (user_type == 1) {
			sql = "update user set user_name=?,password=?,phone_number=? where user_id=" + user_id;
		}
		if (user_type == 2) {
			sql = "update book_admin set manager_name=?,password=?,phone_number=?,id_number=? where manager_id="
					+ user_id;
		}
		if (user_type == 3) {
			sql = "update sys_admin set manager_name=?,password=?,phone_number=?,id_number=? where manager_id="
					+ user_id;
		}
		try {
			if (Comdb.connection == null)
				Comdb.getConn();
			b = Comdb.update(sql, strings);
		} catch (Exception e) {
			System.out.println("SysManageDB.upDateInfoByIdAndType error:"+e.getMessage());
		}
		return b;
	}
	
	/*
	 * @is txt's fileinputstream
	 * @add_type  1:user;2:book_admin;3:sys_admin;4:book_type;5:book
	 */
	public static ArrayList<String> AddInfoByTxt(FileInputStream is,int add_type){
		ArrayList<String> errors=new ArrayList<>();
		try {
			BufferedReader br=new BufferedReader(new InputStreamReader(is,"utf-8"));
			String lineString=null;
			String sql = null;
			int len=0;
			if (add_type == 1) {
				len=4;
				sql = "insert into user(user_id,user_name,password,phone_number) values(?,?,?,?)" ;
			}
			if (add_type == 2) {
				len=5;
				sql = "insert into book_admin(manager_id,manager_name,password,phone_number,id_number) values(?,?,?,?,?)";
			}
			if (add_type == 3) {
				len=5;
				sql = "insert into sys_admin(manager_id,manager_name,password,phone_number,id_number) values(?,?,?,?,?)";
			}
			if (add_type == 4) {
				len=3;
				sql = "insert into type(type_id,type_name,type_libraryroom) values(?,?,?)";
			}
			if (add_type == 5) {
				len=9;
				sql = "insert into book(book_id,book_name,stock,price,author,register_time,press,print_time,type_id) values(?,?,?,?,?,?,?,?,?)";
			}
			int line=1;
			while((lineString=br.readLine())!=null){
				String[] strings=lineString.split("	");
				if(strings.length!=len){
					String error="[on "+line+" error: "+lineString+",check it's length!]";
					errors.add(error);
					continue;
				}
				if(Comdb.connection!=null)
					Comdb.getConn();
				if(!Comdb.update(sql, strings)){
					String error="[on "+line+" error: "+lineString+",check it's content!]";
					errors.add(error);
				}
					
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
