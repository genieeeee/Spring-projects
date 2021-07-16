package project.recomment;

import java.sql.*;

public class ReCommentDTO {

	private int re_idx;
	private int user_idx;
	private int comment_idx;
	private String re_comment;
	private Date re_comment_date;
	private String user_nickname;
	private String user_id;
	
	public ReCommentDTO(){}

	public ReCommentDTO(int re_idx, int user_idx, int comment_idx, String re_comment, Date re_comment_date,
			String user_nickname, String user_id) {
		super();
		this.re_idx = re_idx;
		this.user_idx = user_idx;
		this.comment_idx = comment_idx;
		this.re_comment = re_comment;
		this.re_comment_date = re_comment_date;
		this.user_nickname = user_nickname;
		this.user_id = user_id;
	}

	public int getRe_idx() {
		return re_idx;
	}

	public void setRe_idx(int re_idx) {
		this.re_idx = re_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getComment_idx() {
		return comment_idx;
	}

	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}

	public String getRe_comment() {
		return re_comment;
	}

	public void setRe_comment(String re_comment) {
		this.re_comment = re_comment;
	}

	public Date getRe_comment_date() {
		return re_comment_date;
	}

	public void setRe_comment_date(Date re_comment_date) {
		this.re_comment_date = re_comment_date;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}
