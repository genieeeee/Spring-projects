package project.img;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ImgDAO {
	boolean testOk = false;	//true : 테스트모드  / false : sql문 실행
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public ImgDTO getImg(int idx){
		ImgDTO resultDto = null;
		
		try{
			conn=pro.db.ProDB.getConn();
			if(testOk) throw new testException();
			
			String sql = "select * from img where img_idx=?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			
			rs = ps.executeQuery();
			if(rs.next()){
				int img_idx = rs.getInt("img_idx");
				String img_name = rs.getString("img_name");
				Date img_date = rs.getDate("img_date");
				String img_extension = rs.getString("img_extension");
				String img_path = rs.getString("img_path");
				resultDto = new ImgDTO(img_idx, img_name, img_date, img_extension, img_path);
			}
			
		}catch (testException e) {
			System.out.println("img test용 getImg코드 사용중입니다...");
			
			int img_idx = 1;
			String img_name = "img1.jpg";
			Date img_date = new Date(2011, 1,1);
			String img_extension = ".jpg";
			String img_path = "../upload/img1.jpg";
			
			resultDto = new ImgDTO(img_idx, img_name, img_date, img_extension, img_path);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {}
		}
		return resultDto;
	}
	
	public boolean insertImg(ImgDTO dto){
		boolean result = true;
		
		try{
			conn=pro.db.ProDB.getConn();
			if(testOk) throw new testException();
			
			String sql = "insert into img values(img_idx_i.nextval,?,sysdate, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getImg_name());
			ps.setString(2, dto.getImg_extension());
			ps.setString(3, dto.getImg_path());
			int count = ps.executeUpdate();
			
		}catch (testException e) {
			System.out.println("img test용 insert 코드 사용중입니다...");	
		}catch (Exception e) {
			result = false;
			e.printStackTrace();
			
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {}
		}
		
		return result;
	}
	
	public boolean updateImg(ImgDTO dto){
		boolean result = true;
		try{
			conn=pro.db.ProDB.getConn();
			if(testOk) throw new testException();
			
			String sql = "update img set(img_name, img_extension, img_path) = (?, ?, ?) where img_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getImg_name());
			ps.setString(2, dto.getImg_extension());
			ps.setString(3, dto.getImg_path());
			ps.setInt(4, dto.getImg_idx());
			int count = ps.executeUpdate();
			
		}catch (testException e) {
			System.out.println("img test용 update 코드 사용중입니다...");
			
		}catch (Exception e) {
			result = false;
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {}
		}
		return result;
	}
}

class testException extends Exception{}
