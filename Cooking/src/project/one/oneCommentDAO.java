package project.one;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import project.user.UserDTO;
import project.one.oneCommentDTO;

public class oneCommentDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public oneCommentDAO(){}
	
	public ArrayList<oneCommentDTO> oneComment(int cp, int ls){
		try {
			conn = pro.db.ProDB.getConn();
			String sql = "select * from (select rownum as rnum, a.* from (SELECT * from one ORDER BY one_idx desc)a)b where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<=("+cp+"*"+ls+")";
			
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			ArrayList<oneCommentDTO> arr = new ArrayList<oneCommentDTO>();

			while(rs.next()){
				int one_idx = rs.getInt("one_idx");
				String one_comment = rs.getString("one_comment");
				java.sql.Date comment_date = rs.getDate("comment_date");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				int one_ok = rs.getInt("one_ok");
				oneCommentDTO dto1 = new oneCommentDTO(one_idx, one_comment, comment_date, name, pwd, one_ok);
				arr.add(dto1);
			}

			return arr;
			
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
	
	public int getUserInfo(String user_id){
		try {
			conn=pro.db.ProDB.getConn();
			String sql = "select user_idx from jsp_user where user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_id);			
			rs=ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(rs!=null){rs.close();}
				if(ps!=null){ps.close();}
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}
	}
	
	public int oneComment_ok(String comment, String name, String pwd){
		try {
			conn = pro.db.ProDB.getConn();
			String sql = "insert into one values(one_idx.nextval,?,sysdate,?,?,0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, comment);
			ps.setString(2, name);
			ps.setString(3, pwd);
			int count = ps.executeUpdate();
			
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/*패스워드 가져오는 메소드*/
	public String getPwd(int idx){
		try {
			conn = pro.db.ProDB.getConn();
			String sql = "select pwd from one where one_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			rs.next();
			return rs.getString("pwd");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
/*	총 게시물수 관련 메소드*/
	public int getTotalCnt(){
		try {
			conn = pro.db.ProDB.getConn();
			String sql = "select count(*) from one";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			
			int count = rs.getInt(1);
			return count==0?1:count;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if (rs!=null) {
					rs.close();
				}
				if (ps!=null) {
					ps.close();
				}
				if (conn!=null) {
					conn.close();
				}
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}	
	}
	
	/*삭제관련 메소드*/
	public int oneDelete(int idx){
		try {
			conn = pro.db.ProDB.getConn();
			String sql = "delete from one where one_idx = ?";
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
	
	/*one_ok 업데이트 관련 메소드*/
	public int updateOk(int one_ok, int idx){
		try {
			conn = pro.db.ProDB.getConn();
			String sql = "update one set one_ok = ? where one_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, one_ok);
			ps.setInt(2, idx);
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






