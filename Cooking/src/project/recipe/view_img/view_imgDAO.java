package project.recipe.view_img;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class view_imgDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public view_imgDAO() {
	}
	
	public view_imgDTO view_img(int get_img_idx) {
		try {
			conn=pro.db.ProDB.getConn();
			
			String sql="SELECT * FROM img WHERE img_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, get_img_idx);
			rs=ps.executeQuery();
			view_imgDTO viDTO=null;
			if(rs.next()){
				int img_idx=rs.getInt(1);
				String img_name=rs.getString(2);
			    Date img_date=rs.getDate(3);
			    String img_extension=rs.getString(4);
			    String img_path=rs.getString(5);
			    viDTO=new view_imgDTO(img_idx, img_name, img_date, img_extension, img_path);
			}
			
			return viDTO;
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
