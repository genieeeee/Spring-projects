package project.recipe.recipe_write;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class recipe_writeDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public recipe_writeDAO() {
	}
	
	/**글 작성*/
	public int recipeWrite(recipe_writeDTO rwDTO) {
		try {
			conn=pro.db.ProDB.getConn();
			
			String sql="INSERT INTO recipe values(recipe_idx.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '',0)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, rwDTO.getUser_idx());
			ps.setString(2, rwDTO.getRecipe_category());
			ps.setString(3, rwDTO.getRecipe_title());
			ps.setString(4, rwDTO.getRecipe_img());
			ps.setString(5, rwDTO.getRecipe_simple_comment());
			ps.setString(6, rwDTO.getRecipe_material());
			ps.setString(7, rwDTO.getRecipe_step());
			ps.setInt(8, rwDTO.getRecipe_time_s());
			ps.setInt(9, rwDTO.getRecipe_time_a());
			ps.setInt(10, rwDTO.getRecipe_price());
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
