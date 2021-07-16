package project.recipe.view;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import project.recipe.view.recipe_viewDTO;

public class recipe_viewDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public recipe_viewDAO() {
	}
	
	public recipe_viewDTO recipe_view(int get_recipe_idx) {
		try {
			conn=pro.db.ProDB.getConn();
			
			String sql="SELECT * FROM recipe WHERE recipe_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, get_recipe_idx);
			rs=ps.executeQuery();
			recipe_viewDTO rvDTO=null;
			if(rs.next()){
				int recipe_idx=rs.getInt(1);
			    int user_idx=rs.getInt(2);
	    		String recipe_category=rs.getString(3);
			    String recipe_title=rs.getString(4);
			    String recipe_img=rs.getString(5);
			    String recipe_simple_comment=rs.getString(6);
			    String recipe_material=rs.getString(7);
			    String recipe_step=rs.getString(8);
			    int recipe_time_s=rs.getInt(9);
			    int recipe_time_a=rs.getInt(10);
			    int recipe_price=rs.getInt(11);
			    String recipe_recommend=rs.getString(12);
			    
			    rvDTO=new recipe_viewDTO(recipe_idx, user_idx, recipe_category, recipe_title, recipe_img, recipe_simple_comment, recipe_material, recipe_step, recipe_time_s, recipe_time_a, recipe_price, recipe_recommend);
			}
			
			return rvDTO;
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
	
	public ArrayList<Integer> sidePage(int this_recipe_idx, String this_recipe_category) {
		try {
			conn=pro.db.ProDB.getConn();
			
			String insql="(SELECT rownum rnum,a.* FROM (SELECT * FROM recipe WHERE recipe_category='"+this_recipe_category+"' ORDER BY recipe_idx desc)a)";
			String sql="SELECT recipe_idx FROM "+insql
							+ " WHERE rnum BETWEEN" 
							+ " (SELECT rnum FROM "+insql+" WHERE recipe_idx=?)-1"
							+ " AND (SELECT rnum FROM "+insql+" WHERE recipe_idx=?)+1";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, this_recipe_idx);
			ps.setInt(2, this_recipe_idx);
			rs=ps.executeQuery();
			ArrayList<Integer> arrPage=new ArrayList<Integer>();
			while(rs.next()){
				arrPage.add(rs.getInt(1));
			}
			
			return arrPage;
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
