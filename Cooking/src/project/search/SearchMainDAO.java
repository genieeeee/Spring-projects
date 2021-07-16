package project.search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SearchMainDAO {
	public SearchMainDAO(){	}
	
	boolean testOk = false;	//true : 테스트모드  / false : sql문 실행
	int testListNum = 77;
	SearchMainInterpace smi = new SearchMainInterpace();
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public ArrayList<SearchMainDTO> recipeView(boolean searchOptionTime[], String searchOptionPrice,
			boolean searchOptionCategory[], String searchOptionStr, int searchOptionSelected, int cp, int ls){
		ArrayList<SearchMainDTO> resultList = new ArrayList<SearchMainDTO>();
		
		try{
			if(testOk) throw new testException();
			if(searchOptionStr!=null){
				
				for (int i = 0; i < smi.NO_SEARCH_STR.length(); i++) {
					for (int j = 0; j < searchOptionStr.length(); j++) {
						if(searchOptionStr.substring(j, j+1).equals(smi.NO_SEARCH_STR.substring(i, i+1))) throw new stringException();
					}
				}
			}
			
			conn=pro.db.ProDB.getConn();
			String sqlOption = smi.createSQL(searchOptionTime, searchOptionPrice,
					searchOptionCategory, searchOptionStr, searchOptionSelected);
			String sql = "select * from "
					+ "(select rownum as rnum, a.* from "
					+ "(select * from recipe " + sqlOption +")a)b "
					+ "where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls+
					(searchOptionPrice.equals("") || searchOptionPrice==null?
									" order by recipe_idx desc":"");
			//System.out.println("sql : "+sql);
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
					
					SearchMainDTO tempDto = new SearchMainDTO(recipe_idx, user_idx, recipe_category, 
							recipe_title, recipe_img, recipe_simple_comment, recipe_material, recipe_step, recipe_time_s, recipe_time_a, recipe_price);
					resultList.add(tempDto);
				}while(rs.next());
			}
			
		}catch (testException t) {
			System.out.println("test중입니다...");

			for(int i=0; i<ls; i++){
				if((ls*(cp-1))+i>=testListNum) break;
				resultList.add(new SearchMainDTO());
				resultList.get(i).setRecipe_idx((ls*(cp-1))+i);
				resultList.get(i).setRecipe_title((ls*(cp-1))+i+"번 레시피 제목");
				resultList.get(i).setRecipe_simple_comment((ls*(cp-1))+i+"번 심플 코멘트");
			}
			System.out.println("개수 : "+resultList.size());
			
		}catch (stringException e) {
			System.out.println("문자열 자비좀..");
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("recipeView() 예외 발생..!");
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {}
		}
		return resultList;
	}
	
	/** 검색 후 총 게시물수 관련 메서드 */
	public int getTotalCnt(boolean searchOptionTime[], String searchOptionPrice,
			boolean searchOptionCategory[], String searchOptionStr, int searchOptionSelected){
		try{
			if(testOk) throw new testException();
			if(searchOptionStr!=null){
				for (int i = 0; i < smi.NO_SEARCH_STR.length(); i++) {
					for (int j = 0; j < searchOptionStr.length(); j++) {
						if(searchOptionStr.substring(j, j+1).equals(smi.NO_SEARCH_STR.substring(i, i+1))) throw new stringException();
					}
				}
			}
			
			conn=pro.db.ProDB.getConn();
			String sqlOption = smi.createSQL(searchOptionTime, searchOptionPrice, searchOptionCategory, searchOptionStr, searchOptionSelected);
			String sql="select count(recipe_idx) from recipe " + sqlOption;
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count==0?1:count;
		}catch (testException e) {
			System.out.println("test getTotalCnt()입니다...");
			return testListNum;
		}catch (stringException e) {
			return 1;
		} catch (Exception e) {
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
class stringException extends Exception{}
class testException extends Exception{}
