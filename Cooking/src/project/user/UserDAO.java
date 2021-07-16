package project.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public static final int NOT_ID=1;
	public static final int NOT_PWD=2;
	public static final int LOGIN_OK=3;
	public static final int ERROR=-1;
	
	public UserDAO(){}
	
	
	public int userJoin(UserDTO dto) {
		try {
 
			conn=pro.db.ProDB.getConn();
			String sql = "insert into jsp_user values(jsp_user_idx.nextval,?,?,?,sysdate,?,?,?)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getUser_id());
			ps.setString(2, dto.getUser_pwd());
			ps.setString(3, dto.getUser_nickname());
			ps.setString(4, dto.getUser_tel());
			ps.setInt(5, dto.getUser_q_idx());
			ps.setString(6, dto.getUser_a());	
			int count = ps.executeUpdate();
			return count;
 
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(ps!=null){ps.close();}
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}
	}
	
	
	public boolean idCheck(String user_id){
		try {
 
			conn=pro.db.ProDB.getConn();
			String sql = "select user_id from jsp_user where user_id=?";
			ps = conn.prepareStatement(sql);
			if(user_id==null||user_id.equals("")){
				return true;
			}else{
				ps.setString(1, user_id);
				rs=ps.executeQuery();
				return rs.next();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if(rs!=null){rs.close();}
				if(ps!=null){ps.close();}
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}
	}
	
	
	public boolean telCheck(String user_tel){
		try {
 
			conn=pro.db.ProDB.getConn();
			String sql = "select user_tel from jsp_user where user_tel=?";
			ps = conn.prepareStatement(sql);
			if(user_tel==null||user_tel.equals("")){
				return true;
			}else{				
				ps.setString(1, user_tel);
				rs=ps.executeQuery();
				return rs.next();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if(rs!=null){rs.close();}
				if(ps!=null){ps.close();}
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}
	}
	
	
	public int loginCheck(String userid, String userpwd){

		try {
 
			conn=pro.db.ProDB.getConn();
			String sql = "select user_pwd from jsp_user where user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);			
			rs=ps.executeQuery();
			
			if(rs.next()){
				String db_pwd=rs.getString(1);
				if(db_pwd.equals(userpwd)){

					return LOGIN_OK;
				}else{
					return NOT_PWD;
				}
			}else{
				return NOT_ID;
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		} finally {
			try {
				if(rs!=null){rs.close();}
				if(ps!=null){ps.close();}
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}
	}

	
	public String getUserInfo(String user_id){
		try {
 
			conn=pro.db.ProDB.getConn();
			String sql = "select user_nickname from jsp_user where user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_id);			
			rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
		
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null){rs.close();}
				if(ps!=null){ps.close();}
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}
	}
	
	
	public int getUserInfoPlus(String user_id){
		try {
 
			conn=pro.db.ProDB.getConn();
			String sql = "select user_idx from jsp_user where user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_id);			
			rs=ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(rs!=null){rs.close();}
				if(ps!=null){ps.close();}
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}
	}
	
	
	public String idSearch(String user_nickname, String user_tel){

		try {
 
			conn=pro.db.ProDB.getConn();
			String sql = "select user_id,user_tel,user_nickname from jsp_user where user_nickname=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_nickname);			
			rs=ps.executeQuery();
			
			String db_id="";
			String db_tel="";
			String db_nickname="";
			String result="";
			
			while(rs.next()){
				db_id=rs.getString("user_id");
				db_tel=rs.getString("user_tel");
				db_nickname=rs.getString("user_nickname");
			}
			if(db_tel.equals(user_tel)){
				result= db_id;
			}else{
				result= "잘못입력하셨습니다.";	
			}
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null){rs.close();}
				if(ps!=null){ps.close();}
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}
	}
	
	
	public String pwdSearch(String user_id, int user_q_idx, String user_a){
		try {
			conn=pro.db.ProDB.getConn();
			String sql = "select user_id,user_pwd,user_q_idx,user_a from jsp_user where user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_id);			
			rs=ps.executeQuery();
			
			String db_pwd="";
			int db_user_q_idx=0;
			String db_user_a="";
			String result="";
			
			while(rs.next()){
				db_pwd=rs.getString("user_pwd");
				db_user_q_idx=rs.getInt("user_q_idx");
				db_user_a=rs.getString("user_a");
			}
			if(db_user_a.equals(user_a)){		
				result= db_pwd;
			}else{
				result= "잘못입력하셨습니다.";	
			}
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null){rs.close();}
				if(ps!=null){ps.close();}
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}
	}
	
	public String getUserInfo_Idx(int user_idx){
		try {
 
			conn=pro.db.ProDB.getConn();
			String sql = "select user_nickname from jsp_user where user_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, user_idx);			
			rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
			
		
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null){rs.close();}
				if(ps!=null){ps.close();}
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}
	}

}
