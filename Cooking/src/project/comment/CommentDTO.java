package project.comment;

import java.sql.*;

public class CommentDTO {
	private int comment_idx;
	private int user_idx;
	private String comment_category;
	private String comment_title;
	private String comment_content;
	private int comment_img;
	private Date comment_date;
	private int comment_readnum;
	

	public CommentDTO(){
		
	}
	
	
	public CommentDTO(int comment_idx, int user_idx, String comment_category, String comment_title, String comment_content,
			int comment_img, Date comment_date, int comment_readnum) {
		super();
		this.comment_idx = comment_idx;
		this.user_idx = user_idx;
		this.comment_category=comment_category;
		this.comment_title = comment_title;
		this.comment_content = comment_content;
		this.comment_img = comment_img;
		this.comment_date = comment_date;
		this.comment_readnum = comment_readnum;
	}

	public int getComment_idx() {
		return comment_idx;
	}

	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}


	public String getComment_category() {
		return comment_category;
	}

	public void setComment_category(String comment_category) {
		this.comment_category = comment_category;
	}

	public String getComment_title() {
		return comment_title;
	}

	public void setComment_title(String comment_title) {
		this.comment_title = comment_title;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public int getComment_img() {
		return comment_img;
	}

	public void setComment_img(int comment_img) {
		this.comment_img = comment_img;
	}

	public Date getComment_date() {
		return comment_date;
	}

	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}

	public int getComment_readnum() {
		return comment_readnum;
	}

	public void setComment_readnum(int comment_readnum) {
		this.comment_readnum = comment_readnum;
	}
	
	
	
	
}
