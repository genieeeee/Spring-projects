package project.comment;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import project.recipe.view_img.view_imgDAO;
import project.recipe.view_img.view_imgDTO;
;
public class CommentDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	public CommentDAO(){
		
	}
	
	//메인 commentlist
	public ArrayList<CommentDTO> index_commentMain() {
		try {
 
			conn=pro.db.ProDB.getConn();
			
			String sql = "select * from "+
						"(select rownum as rnum,a.* from "+
						"(select * from jsp_comment order by comment_idx desc)a)b ";
			
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			ArrayList<CommentDTO> arr=new ArrayList<CommentDTO>();
			
			while(rs.next()){
				int comment_idx=rs.getInt("comment_idx");
				int user_idx=rs.getInt("user_idx");
				String comment_category=rs.getString("comment_category");
				String comment_title=rs.getString("comment_title");
				String comment_content=rs.getString("comment_content");
				int comment_img=rs.getInt("comment_img");
				java.sql.Date comment_date=rs.getDate("comment_date");
				int comment_readnum=rs.getInt("comment_readnum");
				
				CommentDTO dto=new CommentDTO(comment_idx, user_idx, comment_category, comment_title, comment_content, comment_img, comment_date, comment_readnum);
				arr.add(dto);
			}
			return arr;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null){rs.close();}
				if (ps != null){ps.close();}
				if (conn != null){conn.close();}
			} catch (Exception e2){
				
			}
		}
	}
	
	//comment_main.jsp
	public ArrayList<CommentDTO> commentMain(int cp, int ls) {
		try {
 
			conn=pro.db.ProDB.getConn();
			
			String sql = "select * from "+
						"(select rownum as rnum,a.* from "+
						"(select * from jsp_comment order by comment_idx desc)a)b "+
						"where rnum >= ("+cp+"-1)*"+ls+"+1 and rnum <= "+cp+"*"+ls;
			
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			ArrayList<CommentDTO> arr=new ArrayList<CommentDTO>();
			
			while(rs.next()){
				int comment_idx=rs.getInt("comment_idx");
				int user_idx=rs.getInt("user_idx");
				String comment_category=rs.getString("comment_category");
				String comment_title=rs.getString("comment_title");
				String comment_content=rs.getString("comment_content");
				int comment_img=rs.getInt("comment_img");
				java.sql.Date comment_date=rs.getDate("comment_date");
				int comment_readnum=rs.getInt("comment_readnum");
				
				CommentDTO dto=new CommentDTO(comment_idx, user_idx, comment_category, comment_title, comment_content, comment_img, comment_date, comment_readnum);
				arr.add(dto);
			}
			return arr;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null){rs.close();}
				if (ps != null){ps.close();}
				if (conn != null){conn.close();}
			} catch (Exception e2){
				
			}
		}
	}
	
	
	public int getTotalCnt(){
		try {
			 
			conn=pro.db.ProDB.getConn();
 
			String sql = "select count(*) from jsp_comment";
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			return count==0?1:count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if (rs != null){rs.close();}
				if (ps != null){ps.close();}
				if (conn != null){conn.close();}
			} catch (Exception e2){
				
			}
		}
	}
	
	
	public int getReadnumber(int comment_idx, int comment_readnum){
		try {
			
			conn=pro.db.ProDB.getConn();
			String sql = "update jsp_comment set comment_readnum=? where comment_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, comment_readnum+1);
			ps.setInt(2, comment_idx);			
			int count=ps.executeUpdate();
			
			
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (rs != null){rs.close();}
				if (ps != null){ps.close();}
			} catch (Exception e2){
				
			}
		}
	}
	
	
	public CommentDTO comment(int idx) {
		try {
 
			conn=pro.db.ProDB.getConn();
			
			String sql = "select * from jsp_comment where comment_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			
			CommentDTO dto=null;
			if(rs.next()){
				int comment_idx=rs.getInt("comment_idx");
				int user_idx=rs.getInt("user_idx");
				String comment_category=rs.getString("comment_category");
				String comment_title=rs.getString("comment_title");
				String comment_content=rs.getString("comment_content");
				int comment_img=rs.getInt("comment_img");
				java.sql.Date comment_date=rs.getDate("comment_date");
				int comment_readnum=rs.getInt("comment_readnum");
				
				dto=new CommentDTO(comment_idx, user_idx, comment_category, comment_title, comment_content, comment_img, comment_date, comment_readnum);
			}
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null){rs.close();}
				if (ps != null){ps.close();}
				if (conn != null){conn.close();}
			} catch (Exception e2){
				
			}
		}
	}
	
	
	public int Comment_write(int user_idx, String comment_category, String comment_title, String comment_content, int comment_img){
		try { 
			conn = pro.db.ProDB.getConn();
			String sql = "insert into jsp_comment values(jsp_comment_comment_idx.nextval,?,?,?,?,?,sysdate,0)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, user_idx);
			ps.setString(2, comment_category);
			ps.setString(3, comment_title);
			ps.setString(4, comment_content);
			ps.setInt(5, comment_img);
			int count=ps.executeUpdate();
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps != null)ps.close();
				if(conn != null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	
	public ArrayList<CommentDTO> commentView(int idx) {
		try {
 
			conn=pro.db.ProDB.getConn();
			
			String sql = "select * from jsp_comment where comment_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			
			ArrayList<CommentDTO> arr=new ArrayList<CommentDTO>();
			
			if(rs.next()){
				int comment_idx=rs.getInt("comment_idx");
				int user_idx=rs.getInt("user_idx");
				String comment_category=rs.getString("comment_category");
				String comment_title=rs.getString("comment_title");
				String comment_content=rs.getString("comment_content");
				int comment_img=rs.getInt("comment_img");
				java.sql.Date comment_date=rs.getDate("comment_date");
				int comment_readnum=rs.getInt("comment_readnum");
				
				CommentDTO dto=new CommentDTO(comment_idx, user_idx, comment_category, comment_title, comment_content, comment_img, comment_date, comment_readnum);
				arr.add(dto);
			}
			
			return arr;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null){rs.close();}
				if (ps != null){ps.close();}
				if (conn != null){conn.close();}
			} catch (Exception e2){
				
			}
		}
	}
	
	
	public String getUser(int user_idx){
		try {
 
			conn=pro.db.ProDB.getConn();
			String sql = "select user_nickname from jsp_user where user_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, user_idx);			
			rs=ps.executeQuery();
			
			String nickname="";
			while(rs.next()){
				nickname=rs.getString("user_nickname");
			}
			return nickname;
		
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null){rs.close();}
				if(ps!=null){ps.close();}
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}
	}
	
	

	public int commentDelete(int comment_idx, String tempPath){
		try{
			
			conn=pro.db.ProDB.getConn();
			
			String sql="SELECT comment_img FROM jsp_comment WHERE comment_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, comment_idx);
			rs=ps.executeQuery();
			if(rs.next()){
				int img_idx=rs.getInt("comment_img");
				if(img_idx!=0){
					sql="SELECT * FROM img WHERE img_idx=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, img_idx);
					rs=ps.executeQuery();
					if(rs.next()){
						view_imgDAO vimgDAO=new view_imgDAO();
						view_imgDTO viDTO=vimgDAO.view_img(img_idx);
						
						File del_img=new File(tempPath + "img/comment/" + viDTO.getImg_idx() + viDTO.getImg_extension());
						del_img.delete();
					}
					
					
					sql="DELETE FROM img WHERE img_idx=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, img_idx);
					ps.executeUpdate();
				}
				
			}
			
			sql="delete jsp_comment where comment_idx=?";				
			ps=conn.prepareStatement(sql);
			ps.setInt(1, comment_idx);
			int count=ps.executeUpdate();
			return count;
			
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(ps!=null){ps.close();}
				if(conn!=null){conn.close();}
			}catch(Exception e2){
				
			}
		}	
	}
	
	/**댓글 개수*/
	public String re_commentCount(int comment_idx){
		try {
 
			conn=pro.db.ProDB.getConn();
			String sql = "SELECT COUNT(*) FROM re_comment WHERE comment_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, comment_idx);
			rs=ps.executeQuery();
			String count=null;
			if(rs.next()){
				count=rs.getString(1);
			}
			
			return count;
		
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null){rs.close();}
				if(ps!=null){ps.close();}
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}
	}
	
	
	
	
}