package project.recipe_modify;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class recipe_modifyDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public recipe_modifyDAO() {
	}
	
	public recipe_modifyDTO showRecipe(int get_recipe_idx) {
		try {
			conn=pro.db.ProDB.getConn();
			
			String sql="SELECT * FROM recipe WHERE recipe_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, get_recipe_idx);
			rs=ps.executeQuery();
			recipe_modifyDTO rnDTO=null;
			if(rs.next()){
				int recipe_idx=rs.getInt("recipe_idx");
				int user_idx=rs.getInt("user_idx");
			    String recipe_category=rs.getString("recipe_category");
			    String recipe_title=rs.getString("recipe_title");
			    String recipe_img=rs.getString("recipe_img");
			    String recipe_simple_comment=rs.getString("recipe_simple_comment");
			    String recipe_material=rs.getString("recipe_material");
			    String recipe_step=rs.getString("recipe_step");
			    int recipe_time_s=rs.getInt("recipe_time_s");
			    int recipe_time_a=rs.getInt("recipe_time_a");
			    int recipe_price=rs.getInt("recipe_price");
			    String recipe_recommend=rs.getString("recipe_recommend");
			    rnDTO=new recipe_modifyDTO(recipe_idx, user_idx, recipe_category, recipe_title, recipe_img, recipe_simple_comment, recipe_material, recipe_step, recipe_time_s, recipe_time_a, recipe_price, recipe_recommend);
			    
			}
			return rnDTO;
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
	
	/**수정*/
	public int recipeModify(recipe_modifyDTO rmDTO, int recipe_idx) {
		try {
			conn=pro.db.ProDB.getConn();
			
			String sql= "UPDATE recipe SET "
		    +"recipe_category=?, "
		    +"recipe_title=?, "
		    +"recipe_img=?, "
		    +"recipe_simple_comment=?, "
		    +"recipe_material=?, "
		    +"recipe_step=?, "
		    +"recipe_time_s=?, "
		    +"recipe_time_a=?, "
		    +"recipe_price=?"
			+" WHERE recipe_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, rmDTO.getRecipe_category());
			ps.setString(2, rmDTO.getRecipe_title());
			ps.setString(3, rmDTO.getRecipe_img());
			ps.setString(4, rmDTO.getRecipe_simple_comment());
			ps.setString(5, rmDTO.getRecipe_material());
			ps.setString(6, rmDTO.getRecipe_step());
			ps.setInt(7, rmDTO.getRecipe_time_s());
			ps.setInt(8, rmDTO.getRecipe_time_a());
			ps.setInt(9, rmDTO.getRecipe_price());
			ps.setInt(10, recipe_idx);
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

}
