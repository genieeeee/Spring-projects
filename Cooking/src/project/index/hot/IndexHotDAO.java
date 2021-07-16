package project.index.hot;

import java.sql.*; 
import java.util.ArrayList;

public class IndexHotDAO {
	boolean testOk = false;	//true : 테스트모드  / false : sql문 실행
	int testListNum = 77;
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public IndexHotDAO() {}

	public ArrayList<IndexHotDTO> hotView(){
		ArrayList<IndexHotDTO> resultList = new ArrayList<IndexHotDTO>();
		
		try{
			if(testOk) throw new testException();
			
			conn=pro.db.ProDB.getConn();
			String sql="select * from "+
					  " (select rownum as rnum, a.* from((select * from recipe order by recipe_recommend_count desc)a)) "+
					  "where rnum <=3";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				do{
					int recipe_idx = rs.getInt("recipe_idx");
					int user_idx = rs.getInt("user_idx");
					String recipe_category = rs.getString("recipe_category");
					String recipe_title = rs.getString("recipe_title");
					String recipe_img = rs.getString("recipe_img");
					String recipe_simple_comment = rs.getString("recipe_simple_comment");
					String recipe_material = rs.getString("recipe_material");
					String recipe_step = rs.getString("recipe_step");
					int recipe_time_s = rs.getInt("recipe_time_s");
					int recipe_time_a = rs.getInt("recipe_time_a");
					int recipe_price = rs.getInt("recipe_price");
					String recipe_recommend = rs.getString("recipe_recommend");
					int recipe_recommend_count = rs.getInt("recipe_recommend_count");
					
					IndexHotDTO tempDto = new IndexHotDTO(recipe_idx, user_idx, recipe_category,
							recipe_title, recipe_img, recipe_simple_comment, recipe_material,
							recipe_step, recipe_time_s, recipe_time_a, recipe_price,
							recipe_recommend, recipe_recommend_count);
					resultList.add(tempDto);
				}while(rs.next());
			}
			
		}catch (testException t) {
			System.out.println("test중입니다...");

			for(int i=0; i<3; i++){
				resultList.add(new IndexHotDTO());
				resultList.get(i).setRecipe_idx(i);
				resultList.get(i).setRecipe_img((i)+"");
				resultList.get(i).setRecipe_category("한식");
				resultList.get(i).setRecipe_title(i+"번 레시피 제목");
				resultList.get(i).setRecipe_simple_comment(i+"번 심플 코멘트");
			}
			
		}catch (Exception e) {
			System.out.println("recipeView() 예외 발생..!");
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {}
		}
		return resultList;
	}
	
	public void dbtest(){
		try{
			conn=pro.db.ProDB.getConn();
			ps=conn.prepareStatement("select * from emp");
			rs=ps.executeQuery();
			if(rs.next()){
					System.out.println("!!");
			}
			
		}catch (Exception e) {
			System.out.println("?");
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	/** 총 게시물수 관련 메서드 */
	public int getTotalCnt(){
		try{
			if(testOk) throw new testException();
			
			conn=pro.db.ProDB.getConn();
			String sql="select count(recipe_idx) from recipe";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count==0?1:count;
		}catch (testException e) {
			System.out.println("test getTotalCnt()입니다...");
			return testListNum;
		}catch (Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {}
		}
	}
	
}

class testException extends Exception{}
