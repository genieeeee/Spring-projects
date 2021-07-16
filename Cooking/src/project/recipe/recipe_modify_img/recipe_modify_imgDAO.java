package project.recipe.recipe_modify_img;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class recipe_modify_imgDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public recipe_modify_imgDAO() {
	}
	
	public void imgDel(int img_idx) {
		try {
			conn=pro.db.ProDB.getConn();
			
			String sql="DELETE FROM img WHERE img_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, img_idx);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	
	public String recipe_img(int recipe_idx) {
		try {
			conn=pro.db.ProDB.getConn();
			
			String sql="SELECT recipe_img FROM recipe WHERE recipe_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, recipe_idx);
			rs=ps.executeQuery();
			String recipe_img=null;
			if(rs.next()){
				recipe_img=rs.getString(1);
			}
			
			return recipe_img;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	public void modify_recipe_img(String recipe_img, int recipe_idx) {
		try {
			conn=pro.db.ProDB.getConn();
			
			String sql="UPDATE recipe SET recipe_img=? WHERE recipe_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, recipe_img);
			ps.setInt(2, recipe_idx);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
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
