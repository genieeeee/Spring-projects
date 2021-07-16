package project.recomment;

import java.sql.*;
import java.util.ArrayList;


public class ReCommentDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ReCommentDAO(){}
	
	/*user_idx 가져오는 메소드*/
	public String getUseridx(String id){
		try {
			conn = pro.db.ProDB.getConn();
			String sql = "select user_idx from jsp_user where user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			String u_id = "";
			while(rs.next()){
				u_id = rs.getString("user_idx");
			}

			return u_id;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs != null)rs.close();
				if(ps != null)ps.close();
				if(conn != null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/*댓글 저장관련 메소드*/
	public int ReWrite(String u_idx, int c_idx, String re_comment){
		try {
			conn = pro.db.ProDB.getConn();
			String sql = "insert into re_comment values(re_idx.nextval,?,?,?,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, u_idx);
			ps.setInt(2, c_idx);
			ps.setString(3, re_comment);
			int count = ps.executeUpdate();
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
			if(ps != null)ps.close();
			if(conn != null)conn.close();
			} catch (Exception e2) {}
		}
	}

	/*댓글 가져오기 메소드*/
	public ArrayList<ReCommentDTO> getReComment(int idx){
		try {
			conn = pro.db.ProDB.getConn();
			String sql = "select re_idx, re_comment.user_idx, comment_idx, re_comment, re_comment_date, user_nickname,user_id  from re_comment,jsp_user where re_comment.user_idx=jsp_user.user_idx and re_comment.comment_idx = ? order by re_idx desc";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			ArrayList<ReCommentDTO> arr = new ArrayList<ReCommentDTO>();

			while(rs.next()){
				int re_idx = rs.getInt("re_idx");
				int user_idx = rs.getInt("user_idx");
				int comment_idx = rs.getInt("comment_idx");
				String re_comment = rs.getString("re_comment");
				Date re_comment_date = rs.getDate("re_comment_date");
				String user_nickname = rs.getString("user_nickname");
				String user_id = rs.getString("user_id");	
				
				ReCommentDTO dto1 = new ReCommentDTO(re_idx, user_idx, comment_idx, re_comment, re_comment_date, user_nickname, user_id);
				arr.add(dto1);
			}
			return arr;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs != null)rs.close();
				if(ps != null)ps.close();
				if(conn != null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/*삭제관련 메소드*/
	public int reDelete(int idx){
		try {
			conn = pro.db.ProDB.getConn();
			String sql = "delete from re_comment where re_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(ps != null)ps.close();
				if(conn != null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	
}
