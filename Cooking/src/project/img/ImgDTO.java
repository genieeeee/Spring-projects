package project.img;

import java.sql.Date;

public class ImgDTO {
	private int img_idx;
	private String img_name;
	private Date img_date;
	private String img_extension;
	private String img_path;
	
	public ImgDTO() {
	}
	
	public ImgDTO(int img_idx, String img_name, Date img_date, String img_extension, String img_path) {
		super();
		this.img_idx = img_idx;
		this.img_name = img_name;
		this.img_date = img_date;
		this.img_extension = img_extension;
		this.img_path = img_path;
	}

	public int getImg_idx() {
		return img_idx;
	}
	public void setImg_idx(int img_idx) {
		this.img_idx = img_idx;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public Date getImg_date() {
		return img_date;
	}
	public void setImg_date(Date img_date) {
		this.img_date = img_date;
	}
	public String getImg_extension() {
		return img_extension;
	}
	public void setImg_extension(String img_extension) {
		this.img_extension = img_extension;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	
	
}
