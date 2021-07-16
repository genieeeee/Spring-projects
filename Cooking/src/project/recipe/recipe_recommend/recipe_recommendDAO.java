package project.recipe.recipe_recommend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class recipe_recommendDAO {
	
	public static final int SELF_RECOMMEND=2;
	public static final int ALREADY_RECOMMEND=1;
	public static final int NOT_RECOMMEND=0;
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public recipe_recommendDAO() {
	}
	
	/**추천 했는지 판단*/
	public int checkRecommend(int recipe_idx, String user_id) {
		try {
			conn=pro.db.ProDB.getConn();
			
			String sql="SELECT user_idx FROM jsp_user WHERE user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, user_id);
			rs=ps.executeQuery();
			int user_idx=0;
			if(rs.next()){
				user_idx=rs.getInt("user_idx");
			}

			sql="SELECT user_idx FROM recipe WHERE recipe_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, recipe_idx);
			rs=ps.executeQuery();
			if(rs.next()){
				if(rs.getInt("user_idx")==user_idx){
					return SELF_RECOMMEND;
				}
			}
			
			sql="SELECT recipe_recommend FROM recipe WHERE recipe_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, recipe_idx);
			rs=ps.executeQuery();
			String recommends="";
			if(rs.next()){
				recommends=rs.getString("recipe_recommend");
			}
			
			if(recommends==null || "".equals(recommends)){
				recommend_Count(recipe_idx);
				return NOT_RECOMMEND;
			}
			else{
				String[] recommendUsers=recommends.split("\\|");
				for(int i=0 ; i<recommendUsers.length ; i++){
					if(Integer.parseInt(recommendUsers[i])==user_idx){
						return ALREADY_RECOMMEND;
					}
				}
				recommend_Count(recipe_idx);
				return NOT_RECOMMEND;
			}
			
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
	
	
	/**추천 하기*/
	public int recommend(int recipe_idx, String user_id) {
		try {
			conn=pro.db.ProDB.getConn();
			
			String sql="SELECT user_idx FROM jsp_user WHERE user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, user_id);
			rs=ps.executeQuery();
			int user_idx=0;
			if(rs.next()){
				user_idx=rs.getInt("user_idx");
			}
			
			sql="UPDATE recipe SET recipe_recommend=recipe_recommend||?||'|' WHERE recipe_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, user_idx);
			ps.setInt(2, recipe_idx);
			int result=ps.executeUpdate();
			
			return result;
			
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
	
	/**추천수 증가*/
	public void recommend_Count(int recipe_idx) {
		try {
			String sql="UPDATE recipe SET recipe_recommend_count=recipe_recommend_count+1 WHERE recipe_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, recipe_idx);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
			} catch (Exception e2) {
			}
		}
	}
	
}
