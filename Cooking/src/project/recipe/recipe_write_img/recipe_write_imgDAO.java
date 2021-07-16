package project.recipe.recipe_write_img;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class recipe_write_imgDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public recipe_write_imgDAO() {
	}
	
	
	public int imgSave(String img_name, String img_extension, String img_path) {
		try {
			conn=pro.db.ProDB.getConn();
			
			String sql="INSERT INTO img values(img_idx_i.nextval, ?, sysdate, ?, ?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, img_name);
			ps.setString(2, img_extension);
			ps.setString(3, img_path);
			
			ps.executeUpdate();
			
			return imgIdx();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	public int imgIdx() {
		try {
			String sql="SELECT MAX(img_idx) FROM img";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int img_idx=0;
			if(rs.next()){
				img_idx=rs.getInt(1);
			}
			
			return img_idx;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	
	

}
