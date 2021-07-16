package project.user;

import java.sql.*;

public class UserDTO {

	private int user_idx;
	private String user_id;
	private String user_pwd;
	private String user_nickname;
	private Date user_date;
	private String user_tel;
	private int user_q_idx;
	private String user_a;
	
	
	public UserDTO(){}
	
	
	public UserDTO(int user_idx, String user_id, String user_pwd, String user_nickname, Date user_date, String user_tel, int user_q_idx, String user_a) 
	{
		super();
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_nickname = user_nickname;
		this.user_date = user_date;
		this.user_tel = user_tel;
		this.user_q_idx = user_q_idx;
		this.user_a = user_a;
	}


	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	
	public Date getUser_date() {
		return user_date;
	}
	public void setUser_date(Date user_date) {
		this.user_date = user_date;
	}

	public String getUser_tel() {
		return user_tel;
	}
	
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public int getUser_q_idx() {
		return user_q_idx;
	}
	public void setUser_q_idx(int user_q_idx) {
		this.user_q_idx = user_q_idx;
	}
	public String getUser_a() {
		return user_a;
	}
	public void setUser_a(String user_a) {
		this.user_a = user_a;
	}
	
	
	
	
	
	
	
	
}


