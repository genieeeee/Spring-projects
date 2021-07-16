package project.recipe.recipe_delet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class recipe_deletDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public recipe_deletDAO() {
	}
	
	public int recipeDelet(int recipe_idx) {
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
			String[] imgs=recipe_img.split("\\|");
			for(int i=0 ; i<imgs.length ; i++){
				sql="DELETE FROM img WHERE img_idx=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, Integer.parseInt(imgs[i]));
				ps.executeUpdate();
			}
			
			sql="DELETE FROM recipe WHERE recipe_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, recipe_idx);
			int count=ps.executeUpdate();
			
			return count;
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
	
	public String imgs(int this_recipe_idx) {
		try {
			conn=pro.db.ProDB.getConn();
			
			String sql="SELECT recipe_img FROM recipe WHERE recipe_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, this_recipe_idx);
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
	
}
