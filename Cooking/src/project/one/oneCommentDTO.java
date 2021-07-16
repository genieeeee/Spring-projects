package project.one;

import java.sql.*;

public class oneCommentDTO {

	private int one_idx;
	private String one_comment;
	private Date comment_date;
	private String name;
	private String pwd;
	private int one_ok;
	
	public oneCommentDTO(){}

	public oneCommentDTO(int one_idx, String one_comment, Date comment_date, String name, String pwd, int one_ok) {
		super();
		this.one_idx = one_idx;
		this.one_comment = one_comment;
		this.comment_date = comment_date;
		this.name = name;
		this.pwd = pwd;
		this.one_ok = one_ok;
	}

	public int getOne_idx() {
		return one_idx;
	}

	public void setOne_idx(int one_idx) {
		this.one_idx = one_idx;
	}

	public String getOne_comment() {
		return one_comment;
	}

	public void setOne_comment(String one_comment) {
		this.one_comment = one_comment;
	}

	public Date getComment_date() {
		return comment_date;
	}

	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getOne_ok() {
		return one_ok;
	}

	public void setOne_ok(int one_ok) {
		this.one_ok = one_ok;
	}

}
